//
//  Chat.swift
//  ISChat
//
//  Created by Fernando Ortiz on 8/2/18.
//  Copyright © 2018 Infinixsoft. All rights reserved.
//

import Foundation

final internal class Chat: Codable {
    
    var id                          : Int?
    var conversationUser            : User?
    var conversationUserReceiver    : User?
    var lastMessage                 : LastMessage?
    
    enum CodingKeys: String, CodingKey {
        case id                         = "user_conversation_id"
        case conversationUser           = "conversation_user"
        case conversationUserReceiver   = "conversation_user_receiver"
        case lastMessage                = "user_last_message"
    }
    
}
