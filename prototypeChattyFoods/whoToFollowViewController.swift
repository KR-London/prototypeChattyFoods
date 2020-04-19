//
//  whoToFollowViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 10/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class whoToFollowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIView {
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    
    set {
      layer.cornerRadius = newValue
    }
  }
}

public class buttonz: UIButton {


    required public init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        
        self.backgroundColor = UIColor.white
        self.cornerRadius = 50
        self.imageView?.clipsToBounds = true
        self.layer.masksToBounds = true

    }
    
    override public var isHighlighted: Bool {
        didSet {
            self.layer.borderWidth = 5
            self.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        }
    }

}


// MARK: - Hiding Back Button

//extension UINavigationItem {
//
//    /// A Boolean value that determines whether the back button is hidden.
//    ///
//    /// When set to `true`, the back button is hidden when this navigation item
//    /// is the top item. This is true regardless of the value in the
//    /// `leftItemsSupplementBackButton` property. When set to `false`, the back button
//    /// is shown if it is still present. (It can be replaced by values in either
//    /// the `leftBarButtonItem` or `leftBarButtonItems` properties.) The default value is `false`.
//    @IBInspectable var hideBackButton: Bool {
//        get { hidesBackButton }
//        set { hidesBackButton = newValue }
//    }
//}
