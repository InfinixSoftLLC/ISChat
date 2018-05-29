//
//  NetworkConfiguration.swift
//  ISChat
//
//  Created by Fernando Ortiz on 10/5/18.
//

import Foundation

struct NetworkConfiguration {
    let baseURL                  : String
    let getChatsEndpointURL      : String
    let deleteChatEndpointURL    : String
    let getMessagesEndpointURL   : String
    let sendMessageEndpointURL   : String
    let deleteMessageEndpointURL : String
    
    init(
        baseURL                  : String                       ,
        getChatsEndpointURL      : String = "/get_chats"        ,
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
