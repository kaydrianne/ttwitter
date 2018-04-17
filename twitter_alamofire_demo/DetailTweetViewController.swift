//
//  DetailTweetViewController.swift
//  twitter_alamofire_demo
//
//  Created by TiAuna Dodd on 4/5/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailTweetViewController: UIViewController {

    var tweets: Tweet?
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    
    @IBAction func retweetButton(_ sender: Any) {
    }
    
    @IBAction func replyButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = tweets?.user.name
        
        
        profileImageView.af_setImage(withURL: (tweets?.user.profileImageUrl)!)
        
        tweetLabel.text = tweets?.text
        usernameLabel.text = tweets?.user.screenName

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
