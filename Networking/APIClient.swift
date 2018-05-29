//
//  APIClient.swift
//  ISChat
//
//  Created by Fernando Ortiz on 10/5/18.
//

import Foundation

public func testAPIClient() {
    let client = APIClient(configuration: NetworkConfiguration(baseURL: "192.168.0.106:3000/api/v1"))
    client.getChats(
        onSuccess: { (chats: [Chat]) in
            print("Chats: \(chats.count)")
        },
        onError: { (error: Error) in
            print("err => \(error)")
        }
    )
}

final internal class APIClient {
    // MARK: - Attributes -
    private let configuration: NetworkConfiguration
    private let dispatcher: NetworkDispatcher
    
    // MARK: - Singleton Instance -
    internal init(configuration: NetworkConfiguration) {
        self.configuration = configuration
        self.dispatcher = NetworkDispatcher(configuration: configuration)
    }
    
    // MARK: - Internal Interface -
    internal func getChats(onSuccess: @escaping ([Chat]) -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.performRequest(
            request: Request(
                path    : configuration.getChatsEndpointURL,
                method  : .post,
                params  : ["hola": true]
            ),
            onSuccess: { (chats: [Chat]) in
                DispatchQueue.main.async {
                    onSuccess(chats)
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
    internal func deleteChat(chatId: Int, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.performRawRequest(
            request: Request(
                path    : configuration.deleteChatEndpointURL,
                method  : .post,
                params  : ["hola": true]
            ),
            onSuccess: { _ in
                DispatchQueue.main.async {
                    onSuccess()
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
    internal func getMessages(chatId: Int, onSuccess: @escaping ([Message]) -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.performRequest(
            request: Request(
                path    : configuration.getMessagesEndpointURL,
                method  : .post,
                params  : ["hola": true]
            ),
            onSuccess: { (messages: [Message]) in
                DispatchQueue.main.async {
                    onSuccess(messages)
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
    internal func sendMessage(message: Message, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.performRawRequest(
            request: Request(
                path    : configuration.sendMessageEndpointURL,
                method  : .post,
                params  : ["hola": true]
            ),
            onSuccess: { _ in
                DispatchQueue.main.async {
                    onSuccess()
                }
            },
            onError: { (error: Error) in
                DispatchQueue.main.async {
                    onError(error)
                }
            }
        )
    }
    internal func deleteMessage(messageId: Int, onSuccess: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        dispatcher.performRawRequest(
            request: Request(
                path    : configuration.deleteMessageEndpointURL,
                method  : .post,
                params  : ["hola": true]
            ),
            onSuccess: { _ in
                DispatchQueue.main.async {
                    onSuccess()
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
