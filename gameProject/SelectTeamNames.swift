//
//  SelectTeamNames.swift
//  gameProject
//
//  Created by oo on 2020-02-07.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class SelectTeamNames: UIViewController {

    @IBOutlet weak var teamLabel1: UILabel!
    @IBOutlet weak var textFieldTeam1: UITextField!
    
    @IBOutlet weak var teamLabel2: UILabel!
    @IBOutlet weak var textFieldTeam2: UITextField!
    
    @IBOutlet weak var teamLabel3: UILabel!
    @IBOutlet weak var textFieldTeam3: UITextField!
    
    @IBOutlet weak var teamLabel4: UILabel!
    @IBOutlet weak var textFieldTeam4: UITextField!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var segueToGame = "segueToGame"
    
    var receivingAnswer: Int?
    
    var teamName1: String?
    var teamName2: String?
    var teamName3: String?
    var teamName4: String?
    

    //var array = [UITextField]()


  //  var array = [UITextField]()

    //var  array = [self.textFieldTeam1, textFieldTeam2, textFieldTeam3, textFieldTeam4]

    override func viewDidLoad() {
        super.viewDidLoad()
        checkRecivingAnswer()
        hiddeLabels()
        ButtonLooks()
        overrideUserInterfaceStyle = .light
       // textFieldTeam1.delegate = self as! UITextFieldDelegate
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)

        
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
//    @objc func keyboardWillShow(notification: NSNotification) {
//    guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
//    print("erika was here")
//       // if keyboard size is not available for some reason, dont do anything
//       return
//    }
//}
    
//    @objc func keyboardWillShow(_ notification: Notification) {
//        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//            let keyboardRectangle = keyboardFrame.cgRectValue
//            let keyboardHeight = keyboardRectangle.height
//        }
//    }
    
    func inputTextFields(){
      // var array = [UITextField.text]
//        for i in 1...receivingAnswer!{
            //current player
            //varsin spelplan
            //byta imellan de olika lagens spelplan
        
//        let team1 = textFieldTeam1
//        let team2 = textFieldTeam2
//        let team3 = textFieldTeam3
//        let team4 = textFieldTeam4
//        let array = [textFieldTeam1.text!, textFieldTeam2.text!, textFieldTeam3.text!, textFieldTeam4.text!]
//        print(array.count)
//        print(array)
        
    }
    
    func checkRecivingAnswer(){
        if receivingAnswer == nil {
            print("nil")
        }
        else{
            print(receivingAnswer!)
        }
    }
    
//
//    @IBAction func textfirld1(_ sender: UITextField) {
//        view.frame.origin.y = -300
//    }
    func hiddeLabels(){
        switch receivingAnswer {
        case 1: receivingAnswer = 1
            teamLabel2.isHidden = true
            textFieldTeam2.isHidden = true
            teamLabel3.isHidden = true
            textFieldTeam3.isHidden = true
            teamLabel4.isHidden = true
            textFieldTeam4.isHidden = true
            print("inne i switch by 1")
        case 2: receivingAnswer = 2
            teamLabel3.isHidden = true
            textFieldTeam3.isHidden = true
            teamLabel4.isHidden = true
            textFieldTeam4.isHidden = true
             print("inne i switch by 2")
        case 3: receivingAnswer = 3
            teamLabel4.isHidden = true
            textFieldTeam4.isHidden = true
            print("inne i switch by 3")
        case 4: receivingAnswer = 4
            print("inne i switch by 4")
        default:
            print("errror")
        }
    }
    @IBAction func startGame(_ sender: Any) {
    inputTextFields()
        performSegue(withIdentifier: "segueToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToGame{
            let destinationVC = segue.destination as! gameFieldViewController
            teamName1 = textFieldTeam1.text!
            teamName2 = textFieldTeam2.text!
            teamName3 = textFieldTeam3.text!
            teamName4 = textFieldTeam4.text!
            destinationVC.recivingName1 = teamName1
            destinationVC.recivingName2 = teamName2
            destinationVC.recivingName3 = teamName3
            destinationVC.recivingName4 = teamName4
            destinationVC.recivingNumber = receivingAnswer
        }
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool
//    {
//        textField.resignFirstResponder()
//        return true
//    }

    @IBAction func textFieldPramaryTriggerPressed(_ sender: UITextField) {
        print("Pramary Trigger Presed")
//      textFieldTeam1.endEditing(true)
//        textFieldTeam2.endEditing(true)
//        textFieldTeam3.endEditing(true)
//        textFieldTeam4.endEditing(true)
    }
    
    @IBAction func dissmisKeyBoard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

    }
    
    
    func ButtonLooks(){
        backButton.layer.cornerRadius = 12
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderWidth = 3
        
        startButton.layer.cornerRadius = 10
        startButton.setTitle("Starta Spelet!", for: .focused)
        startButton.layer.borderWidth = 3
        startButton.layer.borderColor = UIColor.black.cgColor
        
 //       textFieldTeam1.returnKeyType = .done
//        textFieldTeam2.returnKeyType = .done
//        textFieldTeam3.returnKeyType = .done
//        textFieldTeam4.returnKeyType = .done
    }
}
