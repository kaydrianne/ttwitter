//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by TiAuna Dodd on 4/10/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ComposeViewControllerDelegate {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var composeTf: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    
    var delegate: ComposeViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composeTf.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
       
        let characterLimit = 140
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: composeTf.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        countLabel.text = "\(newText.characters.count)"
        // The new text should be allowed? True/False
        return newText.characters.count < characterLimit
    }
    
    @IBAction func sendButtonDidTapped(_ sender: Any) {
        APIManager.shared.composeTweet(with: composeTf.text) { (tweet, error) in
            if error != nil {
            
            }
        }
    
    }
    

}
