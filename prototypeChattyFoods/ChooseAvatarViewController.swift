//
//  ChooseAvatarViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 10/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class ChooseAvatarViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
    let screensize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var stack: UIStackView!
    
    let avatars = [
        0 : #imageLiteral(resourceName: "images-6.jpeg"),
        1 : #imageLiteral(resourceName: "egg.jpg"),
        2 : #imageLiteral(resourceName: "peas.jpg"),
        3 : #imageLiteral(resourceName: "7715164b3215cccda8f7994f9ca25d8e_clipart-face-carrot-clipart-face-carrot-transparent-free-for-_806-1084.png"),
        4 : #imageLiteral(resourceName: "62169851.jpg")
    ]
    
    let selectedCharacter = UIImageView(frame:CGRect(x: UIScreen.main.bounds.width/2 + 60, y: 500, width: 100, height: 100))
    
    override func viewDidAppear(_ animated: Bool) {
//        let nav = self.navigationController?.navigationBar
//        
//        nav?.barStyle = UIBarStyle.black
//        nav?.tintColor = UIColor.yellow
//        
//        nav?.backItem?.title = ""
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        stack = UIStackView(frame: CGRect(x: 0, y: 200, width: screenWidth, height: screenHeight))
             //  scrollView.contentSize = CGSize(width: screenWidth, height: 200000)
        stack.axis = .vertical
               
               
        let carousel = iCarousel(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .coverFlow
    
        var label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 284)
        label.textAlignment = NSTextAlignment.center
        label.text = "Which character will you be?"
        
        let buttonWidth: CGFloat = 300
        let buttonHeight: CGFloat = 40
        let frame = CGRect(x: (view.frame.width-buttonWidth)/2, y: (view.frame.height-buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        
        var button = UIButton(frame: frame)
        button.setTitle("Play as this character", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        //    private func addButon() {
        //         let buttonWidth: CGFloat = 150
        //         let buttonHeight: CGFloat = 20
        //         let frame = CGRect(x: (view.frame.width-buttonWidth)/2, y: (view.frame.height-buttonHeight)/2, width: buttonWidth, height: buttonHeight)
        //         let button = UIButton(frame: frame)
        //         button.setTitle("Button", for: .normal)
        //         button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        //         view.addSubview(button)
        //     }
        
        var bioStack = UIStackView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight/4))
        //  scrollView.contentSize = CGSize(width: screenWidth, height: 200000)
        bioStack.axis = .horizontal
          
        selectedCharacter.image = #imageLiteral(resourceName: "7715164b3215cccda8f7994f9ca25d8e_clipart-face-carrot-clipart-face-carrot-transparent-free-for-_806-1084.png")
        
        selectedCharacter.isHidden = true
        
        bioStack.addSubview(selectedCharacter)
        view.addSubview(bioStack)
        
        bioStack.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        
        stack.addSubview(label)
        stack.addSubview(carousel)
        //stack.addSubview(bioStack)
        stack.addSubview(button)
        
       // stack.distribution = .fillProportionally
        self.view.addSubview(stack)

       

    }
    
    @objc func buttonTapped() {
        performSegue(withIdentifier: "toWhoToFollow", sender: self)
   }
    
    

    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }

    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let imageView: UIImageView

        if view != nil {
            imageView = view as! UIImageView
        } else {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 128))
        }

        imageView.image = avatars[index]
        //imageView.image = #imageLiteral(resourceName: "salmon.jpg")

        return imageView
    }
    
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int)
     {
        print("I clicked on" + String(index))
        selectedCharacter.isHidden = false
        ///self .performSegue(withIdentifier: "imageDisplaySegue", sender: nil)
    }
}
