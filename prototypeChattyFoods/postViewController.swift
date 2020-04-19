//
//  postViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 06/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class postViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var mainPic: UIImageView!
    @IBAction func likeButtonPressed(_ sender: postButton) {
       print("I like this")
        likeButton.isSelected = !likeButton.isSelected
        
    }
    @IBOutlet weak var likeButton: postButton!
    
    @IBAction func commentButtonPressed(_ sender: Any) {
        
        /// launch a detail view with comments 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 246/255, green: 171/255, blue: 9/255, alpha: 1)
        mainPic.image = #imageLiteral(resourceName: "How2Bto2Bboil2Beggs2B10.jpg")
    }
    
}
