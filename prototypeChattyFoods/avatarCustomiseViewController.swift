//
//  avatarCustomiseViewController.swift
//  prototypeChattyFoods
//
//  Created by Kate Roberts on 19/04/2020.
//  Copyright © 2020 Kate Roberts. All rights reserved.
//

import UIKit

class avatarCustomiseViewController: UIViewController, UITextFieldDelegate {
    
    let screensize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var congrats: myLabel!
    var mugshot: UIImageView!
    var question: myLabel!
    var answer: UITextField!
    var stack: UIStackView!
    
//    override func viewWillAppear() {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        stack = UIStackView(frame: CGRect(x: 20, y: 20, width: screenWidth - 40 , height: screenHeight - 40))
        stack.axis = .vertical
        stack.spacing = 200
        stack.distribution = .fillProportionally
        
        //stack.translatesAutoresizingMaskIntoConstraints = false
        //stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, multiplier: <#T##CGFloat#>)
        
        congrats = myLabel(frame: CGRect(x: 0, y: 70, width: screenWidth - 40, height: 100))
        congrats.text = "Congratulations! Your very own carrot!"
        
        mugshot = UIImageView()
        mugshot.image = UIImage(named: "7715164b3215cccda8f7994f9ca25d8e_clipart-face-carrot-clipart-face-carrot-transparent-free-for-_806-1084.png")
        
   
        
       
        
        congrats = myLabel(frame: CGRect(x: 0, y: 0, width: screenWidth - 40, height: 100))
        congrats.text = "Congratulations! Your very own carrot!"
        congrats.textAlignment = .center
        
        question = myLabel(frame: CGRect(x: 0, y: 75, width: screenWidth - 40, height: 100))
        question.text = "What's his name?"
        question.textAlignment = .center
        
        stack.addSubview(congrats)
        stack.addSubview(question)
        stack.addSubview(mugshot)
        
        mugshot.translatesAutoresizingMaskIntoConstraints = false
        mugshot.heightAnchor.constraint(equalToConstant: 250).isActive = true
        mugshot.widthAnchor.constraint(equalToConstant: 250).isActive = true
        mugshot.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        mugshot.centerYAnchor.constraint(equalTo: stack.centerYAnchor, constant: -100).isActive = true
        
        answer = UITextField(frame: CGRect(x: 0, y: 600, width: screenWidth - 40, height: 70))
        answer.returnKeyType = .done
        answer.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        answer.cornerRadius = 10
        answer.placeholder = "Carroty McCarrotFace"
        answer.layer.borderWidth = 5
        answer.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        answer.textAlignment = .center
        answer.addTarget(self, action: #selector(haveAName), for: .editingDidEnd)
       // answer.addTarget(self, action: "haveAName", for: .touchUpOutside)
        stack.addSubview(answer)
        
        answer.delegate = self
        
        view.addSubview(stack)
        stack.setNeedsLayout()
    }
    
    @objc func haveAName(textField: UITextField){
        textField.resignFirstResponder()
        print("My name is " + (textField.text ?? "Carroty McCarrotFace"))
        congrats.isHidden = true
        question.isHidden = true
        answer.isHidden = true
        newQuestion(name: textField.text ?? "Carroty McCarrotFace")
    }
    
    @objc func doneHere(){
//          let chooseFriendsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chooseFriends") as! whoToFollowViewController
//
//            chooseFriendsVC.name = (answer.text ?? "carrot")
//        let myNav = self.navigationController
//        myNav?.pushViewController(chooseFriendsVC, animated: true)
        
        performSegue(withIdentifier: "temp", sender: self)
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func newQuestion(name: String)
    {
        var newlabel = myLabel(frame: CGRect(x: 0, y: 40, width: screenWidth - 40, height: 100))
        newlabel.text = "He looks like a " + name + "!"
        newlabel.textAlignment = .center
        
        var newQ = myLabel(frame: CGRect(x: 0, y: 75, width: screenWidth - 40, height: 100))
        newQ.text = "What's his personality like?"
        newQ.textAlignment = .center
        
        var personality = UISlider(frame: CGRect(x: 40, y: 450, width: screenWidth - 100, height: 100))
      var personalityMin = UILabel(frame: CGRect(x: 0, y: 420, width: 100, height: 100))
       personalityMin.text = "grouchy"
       
       var personalityMax = UILabel(frame: CGRect(x: screenWidth - 90, y: 420, width: 100, height: 100))
           personalityMax.text = "cheery"
        var taste = UISlider(frame: CGRect(x: 40, y: 520, width: screenWidth - 100, height: 100))
  
        var tasteMin = UILabel(frame: CGRect(x: 0, y: 490, width: 100, height: 100))
        tasteMin.text = "savoury"
        
        var tasteMax = UILabel(frame: CGRect(x: screenWidth - 80, y: 490, width: 100, height: 100))
            tasteMax.text = "sweet"
        
        var texture = UISlider(frame: CGRect(x: 40, y: 600, width: screenWidth - 100, height: 100))
        var textureMin = UILabel(frame: CGRect(x: 0, y: 570, width: 100, height: 100))
        textureMin.text = "mushy"
        
        var textureMax = UILabel(frame: CGRect(x: screenWidth - 90, y: 570, width: 100, height: 100))
            textureMax.text = "crunchy"
        
        var moveOnButton = myButton(frame: CGRect(x: 20, y: 680, width: screenWidth - 90, height: 80))
        //moveOnButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        //moveOnButton.cornerRadius = 30
        moveOnButton.setTitle("Finished Here", for: .normal)
        //moveOnButton.setTitleColor(UIColor.black, for: .normal)
        moveOnButton.addTarget(self, action: #selector(doneHere), for: .touchUpInside)
        
        stack.isUserInteractionEnabled = true
        stack.addSubview(newQ)
        stack.addSubview(newlabel)
        stack.addSubview(personality)
        stack.addSubview(personalityMin)
        stack.addSubview(personalityMax)
        stack.addSubview(tasteMin)
        stack.addSubview(taste)
        stack.addSubview(tasteMax)
        stack.addSubview(textureMin)
        stack.addSubview(texture)
        stack.addSubview(textureMax)
        stack.addSubview(moveOnButton)
    }

}
