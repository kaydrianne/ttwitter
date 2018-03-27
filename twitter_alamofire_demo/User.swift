//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String
    var profilePic: String
    init(dictionary: [String: Any]) {
        name = dictionary["name"] as! String
        profilePic = (dictionary["profile_image_url_https"] as? String)!
    }
}
