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
    @IBAction func likeButtonPressed(_ sender: UIButton) {
    }
    @IBOutlet weak var likeButton: UIButton!
    
    @IBAction func commentButtonPressed(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        mainPic.image = #imageLiteral(resourceName: "How2Bto2Bboil2Beggs2B10.jpg")
        //  likeButton.setImage(#imageLiteral(resourceName: "peas.jpg"), for: .selected)
        // Do any additional setup after loading the view.
    }
    

//    private func addButon() {
//         let buttonWidth: CGFloat = 150
//         let buttonHeight: CGFloat = 20
//         let frame = CGRect(x: (view.frame.width-buttonWidth)/2, y: (view.frame.height-buttonHeight)/2, width: buttonWidth, height: buttonHeight)
//         let button = UIButton(frame: frame)
//         button.setTitle("Button", for: .normal)
//         button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//         view.addSubview(button)
//     }
//
//     override func viewWillLayoutSubviews() {
//         addButon()
//     }

//     @objc func buttonTapped() {
//         print("Button tapped in \(self)")
//     }
}
