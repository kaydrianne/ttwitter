//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/17/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import Foundation

class User {
    
    var name: String?
    var screenName: String?
    var location: String?
    var url: String?
    var description: String?
    var followersCount: Int?
    var friendsCount: Int?
    var favoritesCount: Int?
    var statusesCount: Int?
    var createdAt: String?
    var profileBackgroundImageUrl: String?
    var profileImageUrl: URL?
    var backgroundImageUrl: URL?
    
    
    var dictionary: [String:Any]?
    
    private static var _current: User?
    
    init(dictionary: [String: Any]) {
        //   print(dictionary)
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        location = dictionary["location"] as? String
        url = dictionary["url"] as? String
        description = dictionary["description"] as? String
        followersCount = dictionary["followers_count"] as? Int
        friendsCount = dictionary["friends_count"] as? Int
        favoritesCount = dictionary["favorites_count"] as? Int
        statusesCount = dictionary["statuses_count"] as? Int
        createdAt = dictionary["created_at"] as? String
        profileBackgroundImageUrl = dictionary["profile_background_image_url"] as? String
        guard let profileImgString = dictionary["profile_image_url_https"] as? String else { return }
        //print(profileImgString)
        profileImageUrl = URL(string: profileImgString)
   //     backgroundImageUrl = URL(string: profileBackgroundImageUrl!)
        
        self.dictionary = dictionary
        
        print(dictionary)
        
    }
    
    static var current: User? {
        get {
            if _current == nil {
                let defaults = UserDefaults.standard
                if let userData = defaults.data(forKey: "currentUserData") {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData, options: []) as! [String: Any]
                    _current = User(dictionary: dictionary)
                }
            }
            return _current
        }
        set (user) {
            _current = user
            let defaults = UserDefaults.standard
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.dictionary!, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.removeObject(forKey: "currentUserData")
            }
        }
    }
    
    
}

