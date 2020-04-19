//
//  FirstViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 05/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

let posts = [ 1: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-2.jpeg")),
           2: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "image.jpeg")),
           8: (#imageLiteral(resourceName: "images-7.jpeg"),#imageLiteral(resourceName: "peasMeme.001.jpeg")),
           4: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-3.jpeg")),
            5: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "images-3.png")),
            6: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "Fruit-Leather1.jpg")),
              7: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-4.jpeg")),
              3: (#imageLiteral(resourceName: "62169851.jpg"),#imageLiteral(resourceName: "tenor.gif")),
              0: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-5.jpeg"))
]

class FirstViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var stackView: UIStackView!
    
//    let posts = [ 1: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-2.jpeg")),
//               2: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "image.jpeg")),
//               3: (#imageLiteral(resourceName: "images-7.jpeg"),#imageLiteral(resourceName: "peasMeme.001.jpeg")),
//               4: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-3.jpeg")),
//                5: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "images-3.png")),
//                6: (#imageLiteral(resourceName: "images-6.jpeg"),#imageLiteral(resourceName: "Fruit-Leather1.jpg")),
//                  7: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-4.jpeg")),
//                  // 8: (),
//                  0: (#imageLiteral(resourceName: "egg.jpg"),#imageLiteral(resourceName: "images-5.jpeg"))
//    ]
   // as! [Int : (UIImage, UIImage)]
    
//    override func viewWillAppear(_ animated: Bool) {
//
//         self.navigationItem.hidesBackButton =  true
//    }

    override func viewDidLoad() {
        
       
        
        super.viewDidLoad()
        
     
        navigationItem.hidesBackButton = true
        
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height

        
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 120, width: screenWidth, height: screenHeight))
      //  scrollView.contentSize = CGSize(width: screenWidth, height: 200000)
    
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain scroll view
        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true;
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true;
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true;
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true;
        
        var postMatrix = [postViewController]()
        
        for _ in 0...7{
            postMatrix.append(storyboard!.instantiateViewController(identifier: "postTemplate") as! postViewController)
        }
        
       for x in 0...7{
        
   //        let post = storyboard!.instantiateViewController(identifier: "postTemplate") as! postViewController
           // addChild(postMatrix[x])
               
            postMatrix[x].view.translatesAutoresizingMaskIntoConstraints = false
        
            scrollView.addSubview(postMatrix[x].view)
        
            postMatrix[x].mainPic.image = posts[x]?.1
            postMatrix[x].profilePic.image = posts[x]?.0

           // post.mainPic.image = posts[1]?.0
        
            NSLayoutConstraint.activate([
                postMatrix[x].view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
                postMatrix[x].view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
                postMatrix[x].view.heightAnchor.constraint(equalTo: postMatrix[x].view.widthAnchor, multiplier: 1.3)
            ])
        
            if x == 0{
                postMatrix[x].view.topAnchor.constraint(equalTo:scrollView.topAnchor, constant: 10).isActive = true
            }
            else{
                postMatrix[x].view.topAnchor.constraint(equalTo:postMatrix[x-1].view.bottomAnchor, constant: 10).isActive = true
            }
        
        if x == 3 {
            let gif = UIImage.gifImageWithName(name: "tenor")
            //let gifURL : String = "https://tenor.com/yOVR.gif"
            //let gif = UIImage.gifImageWithURL(gifUrl: gifURL)
            postMatrix[x].mainPic.image = gif
        }
        
           // postMatrix[x].didMove(toParent: self)
       }
        
//        let post2 = storyboard!.instantiateViewController(identifier: "postTemplate") as! postViewController
//          addChild(post2)
//
//          post2.view.translatesAutoresizingMaskIntoConstraints = false
//
//          scrollView.addSubview(post2.view)
//
//          post2.mainPic.image = #imageLiteral(resourceName: "images-2.jpeg")
//          post2.profilePic.image = #imageLiteral(resourceName: "egg.jpg")
//
//
//          NSLayoutConstraint.activate([
//              post2.view.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
//              post2.view.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
//              post2.view.topAnchor.constraint(equalTo:post.view.bottomAnchor, constant: 10),
//              post2.view.heightAnchor.constraint(equalTo: post.view.widthAnchor, multiplier: 1.3)
//          ])
//
//          post2.didMove(toParent: self)
        
    }

    override func viewDidLayoutSubviews()
    {
        scrollView.delegate = self as? UIScrollViewDelegate
        scrollView.contentSize = CGSize(width:self.view.frame.size.width, height: self.view.frame.size.width*1.4*8) // set height according you
    }

}
