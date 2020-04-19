//
//  whoToFollowViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 10/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class whoToFollowViewController: UIViewController {
    
    @IBOutlet weak var proceed: myButton!
    var name: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
        proceed.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    }

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

