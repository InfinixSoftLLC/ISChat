//
//  Message.swift
//  ISChat
//
//  Created by Fernando Ortiz on 8/2/18.
//  Copyright © 2018 Infinixsoft. All rights reserved.
//

import Foundation

final class Message: Mappable {
    
    var id: Int?
    var chatID: Int?
    var senderID: Int?
    var receiverID: Int?
    var receiverProfilePicture: String?
    var mimeType: String?
    var content: String?
    
}

final class LastMessage: Mappable {
    var message: Message?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
