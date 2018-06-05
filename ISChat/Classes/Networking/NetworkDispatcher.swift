//
//  RequestUtils.swift
//  ISChat
//
//  Created by Fernando Ortiz on 17/5/18.
//

import Foundation

internal typealias JSON = [String: Any]

internal enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
}

internal struct Request {
    let path    : String
    let method  : HTTPMethod
    let params  : JSON
}

public enum NetworkError: Error {
    case invalidURL
    case noData
}

internal struct NetworkDispatcher {
    let configuration: NetworkConfiguration
    
    init(configuration: NetworkConfiguration) {
        self.configuration = configuration
    }
    
    internal func performRawRequest(request: Request, onSuccess: @escaping (Data) -> Void, onError: @escaping (Error) -> Void) {
        guard let url = URL(string: configuration.baseURL + request.path) else {
            onError(NetworkError.invalidURL)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: request.params, options: [])
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        } catch let error {
            onError(error)
            return
        }
        
        URLSession.shared.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                onError(error)
                return
            }
            
            guard let _data = data else {
                onError(NetworkError.noData)
                return
            }
            
            onSuccess(_data)
        }.resume()
    }
    
    internal func performRequest<T>(request: Request, onSuccess: @escaping (T) -> Void, onError: @escaping (Error) -> Void) where T:Codable {
        performRawRequest(
            request: request,
            onSuccess: { (data: Data) in
                do {
                    let decoder = JSONDecoder()
                    let result: T = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        onSuccess(result)
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        onError(error)
                    }
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
}

