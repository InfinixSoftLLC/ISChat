//
//  Chat.swift
//  ISChat
//
//  Created by Fernando Ortiz on 8/2/18.
//  Copyright © 2018 Infinixsoft. All rights reserved.
//

import Foundation

public final class Chat {
    
    var id: Int?
    var userSenderID: Int?
    var userReceiverID: Int?
    var userReceiverName: String?
    var lastMessage: Message?
    var isRead: Bool?
    var userReceiverImageUrl: String?
    
}
