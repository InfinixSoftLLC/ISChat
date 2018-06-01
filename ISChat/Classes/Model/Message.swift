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
    var receiverID              : Int?
    var receiverProfilePicture  : String?
    var mimeType                : String?
    var content                 : String?
    
    enum CodingKeys: String, CodingKey {
        case id                     = "id"
        case chatID                 = "chat_id"
        case senderID               = "sender_id"
        case receiverID             = "receiver_id"
        case receiverProfilePicture = "receiver_profile_picture"
        case mimeType               = "mime_type"
        case content                = "content"
    }
    
}

final internal class LastMessage: Codable {
    var message: Message?
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
