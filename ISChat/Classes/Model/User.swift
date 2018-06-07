//
//  User.swift
//  ISChat
//
//  Created by admin on 7/6/18.
//

import Foundation

final internal class User : Codable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var profilePicture: String?
    
    enum CodingKeys: String, CodingKey {
        case id                     = "id"
        case firstName              = "first_name"
        case lastName               = "last_name"
        case profilePicture         = "profile_picture"
    }
}
