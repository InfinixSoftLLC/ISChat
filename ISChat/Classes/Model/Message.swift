//
//  Message.swift
//  ISChat
//
//  Created by Fernando Ortiz on 8/2/18.
//  Copyright © 2018 Infinixsoft. All rights reserved.
//

import Foundation

final internal class Message: Codable {
    
    var id                      : Int?
    var chatID                  : Int?
    var senderID                : Int?
    var senderName              : String?
    var receiverID              : Int?
    var receiverProfilePicture  : String?
    var mimeType                : String?
    var content                 : String?
    
    enum CodingKeys: String, CodingKey {
        case id                     = "id"
        case chatID                 = "chat_id"
        case senderID               = "sender_id"
        case senderName             = "sender_name"
        case receiverID             = "receiver_id"
        case receiverProfilePicture = "receiver_profile_picture"
        case mimeType               = "mime_type"
        case content                = "content"
    }
    
}

final internal class LastMessage: Codable {
    var message: Message?
    var id: Int?
    var isRead: Bool?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
        case id      = "user_message_id"
        case isRead  = "is_read"
    }
}
