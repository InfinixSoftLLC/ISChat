//
//  Chat.swift
//  ISChat
//
//  Created by Fernando Ortiz on 8/2/18.
//  Copyright © 2018 Infinixsoft. All rights reserved.
//

import Foundation

final internal class Chat: Codable {
    
    var id                      : Int?
    var userSenderID            : Int?
    var userReceiverID          : Int?
    var userReceiverName        : String?
    var lastMessage             : Message?
    var isRead                  : Bool?
    var userReceiverImageUrl    : String?
    
    enum CodingKeys: String, CodingKey {
        case id                     = "id"
        case userSenderID           = "user_sender_id"
        case userReceiverID         = "user_receiver_id"
        case userReceiverName       = "user_receiver_name"
        case lastMessage            = "last_message"
        case isRead                 = "is_read"
        case userReceiverImageUrl   = "user_receiver_image_url"
    }
    
}
