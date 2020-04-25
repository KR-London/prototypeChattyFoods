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

        stack = UIStackView(frame: CGRect(x: 0, y: 150, width: screenWidth, height: screenHeight))
             //  scrollView.contentSize = CGSize(width: screenWidth, height: 200000)
        stack.axis = .vertical
               
               
        let carousel = iCarousel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        carousel.dataSource = self
        carousel.delegate = self
        carousel.type = .coverFlow
    
        var label = myLabel(frame: CGRect(x: 0, y: 25, width: screenWidth, height: 150))
        label.center = CGPoint(x: screenWidth/2, y: 384)
//        label.textAlignment = NSTextAlignment.center
//        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.text = "Who do you want to get to know better?"

        
        // check >>> a bit fatter
        
       // label.font = label.font.withSize(24)
            ///UIFont.systemFont(ofSize: 20, weight: UIFont.Weight(rawValue: 100))
        
        let buttonWidth: CGFloat = 300
        let buttonHeight: CGFloat = 80
        let frame = CGRect(x: (view.frame.width-buttonWidth)/2, y: (view.frame.height-buttonHeight)/2 + 150, width: buttonWidth, height: buttonHeight)
        
        var button = myButton(frame: frame)
        button.setTitle("I choose you!", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        
//        var bioStack = UIStackView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight/4))
//        //  scrollView.contentSize = CGSize(width: screenWidth, height: 200000)
//        bioStack.axis = .horizontal
          
        selectedCharacter.image = #imageLiteral(resourceName: "7715164b3215cccda8f7994f9ca25d8e_clipart-face-carrot-clipart-face-carrot-transparent-free-for-_806-1084.png")
        selectedCharacter.isHidden = true
        
        stack.addSubview(selectedCharacter)
        
      

  
        
        
        stack.addSubview(label)
        stack.addSubview(carousel)
        //stack.addSubview(bioStack)
        stack.addSubview(button)
        
        selectedCharacter.translatesAutoresizingMaskIntoConstraints = false
        //selectedCharacter.topAnchor.constraint(greaterThanOrEqualTo: label.bottomAnchor).isActive = true
        selectedCharacter.bottomAnchor.constraint(lessThanOrEqualTo: button.topAnchor, constant: -5).isActive = true
        //selectedCharacter.topAnchor.constraint(greaterThanOrEqualTo: label.bottomAnchor, constant: 20).isActive = true
        selectedCharacter.heightAnchor.constraint(equalToConstant: 100).isActive = true
        selectedCharacter.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        selectedCharacter.widthAnchor.constraint(equalToConstant: 100).isActive = true
        selectedCharacter.contentMode = .scaleAspectFit
              
        
       // stack.distribution = .fillProportionally
        self.view.addSubview(stack)
        
        //stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true

       

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
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        }

        imageView.cornerRadius = 20
        imageView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.image = avatars[index]
        imageView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
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
