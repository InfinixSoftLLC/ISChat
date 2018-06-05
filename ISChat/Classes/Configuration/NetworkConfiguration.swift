//
//  NetworkConfiguration.swift
//  ISChat
//
//  Created by Fernando Ortiz on 10/5/18.
//

import Foundation

public struct NetworkConfiguration {
    public let baseURL                  : String
    public let getChatsEndpointURL      : String
    public let deleteChatEndpointURL    : String
    public let getMessagesEndpointURL   : String
    public let sendMessageEndpointURL   : String
    public let deleteMessageEndpointURL : String
    
    public init(
        baseURL                  : String                       ,
        getChatsEndpointURL      : String = "/get_conversation" ,
        deleteChatEndpointURL    : String = "/delete_chat"      ,
        getMessagesEndpointURL   : String = "/get_messages"     ,
        sendMessageEndpointURL   : String = "/send_message"     ,
        deleteMessageEndpointURL : String = "/delete_message"
    ) {
        self.baseURL                  = baseURL
        self.getChatsEndpointURL      = getChatsEndpointURL
        self.deleteChatEndpointURL    = deleteChatEndpointURL
        self.getMessagesEndpointURL   = getMessagesEndpointURL
        self.sendMessageEndpointURL   = sendMessageEndpointURL
        self.deleteMessageEndpointURL = deleteMessageEndpointURL
    }
}
