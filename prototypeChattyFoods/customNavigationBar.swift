//
//  customNavigationBar.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 11/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class customNavigationController: UINavigationController {

        ///navigationItem.hidesBackButton = true
    
  override func viewDidLoad() {
           super.viewDidLoad()


            navigationBar.barTintColor = UIColor(red: 103/255, green: 230/255, blue: 194/255, alpha: 1)
            navigationBar.backgroundColor = UIColor(red: 103/255, green: 230/255, blue: 194/255, alpha: 1)
          //// navigationBar.barTintColor = UIColor(red: 0/255, green: 0/255, blue: 194/255, alpha: 1)
           
           navigationBar.tintColor = UIColor(red: 3/255, green: 18/255, blue: 8/255, alpha: 1)

   //
           UIBarButtonItem.appearance().setTitleTextAttributes(
           [
               //UIFont(name: "TwCenMT-CondensedExtraBold", size: 24 )
               //NSAttributedString.Key.font : UIFont(name: "TwCenMT-CondensedExtraBold", size: 18 )!,
               NSAttributedString.Key.foregroundColor : UIColor.black,
           ], for: .normal )


           UIBarButtonItem.appearance().setTitleTextAttributes(
                 [
                     //NSAttributedString.Key.font : UIFont(name: "TwCenMT-CondensedExtraBold", size: 18 )!,
                     NSAttributedString.Key.foregroundColor : UIColor.black,
           ], for: .disabled )

           UIBarButtonItem.appearance().setTitleTextAttributes(
                 [
                    // NSAttributedString.Key.font : UIFont(name: "TwCenMT-CondensedExtraBold", size: 18 )!,
                     NSAttributedString.Key.foregroundColor : UIColor.clear,
           ], for: .reserved )

           UIBarButtonItem.appearance().setTitleTextAttributes(
                        [
                            //NSAttributedString.Key.font : UIFont(name: "TwCenMT-CondensedExtraBold", size: 18 )!,
                            NSAttributedString.Key.foregroundColor : UIColor.clear,
           ], for: .application )
    
        navigationItem.backBarButtonItem?.title = "Dog"
        navigationItem.hidesBackButton = true
       }
    
}
