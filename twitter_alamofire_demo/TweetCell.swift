//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


class TweetCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            usernameLabel.text = tweet.user.name
            
            profileImageView.af_setImage(withURL: tweet.user.profileImageUrl!)
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func replyButton(_ sender: Any) {
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        tweet.favorited = true
        tweet.favoriteCount? += 1
        APIManager.shared.favorite(tweet) { (tweet, error) in
            if error == nil {
                
                
                // add the OK action to the alert controller
               
                
                print("FavoriteSucccess")
            }

        }
    }
    @IBAction func retweetButton(_ sender: Any) {
        
        APIManager.shared.retweet(tweet) { (tweet, error) in
            if error == nil {
                print("RetweetSucccess")
            } else {
                print(error?.localizedDescription)
            }
        }
    }
}
