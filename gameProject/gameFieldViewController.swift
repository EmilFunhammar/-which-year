//
//  gameFieldViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-16.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class gameFieldViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var questionCardLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var questions = Questions()
   // var question : [Questions] = []
   // var asktQuestions : [Question] = []
  //  var currentQuestion = Questions()
    var i = 0
    var x = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamLabel.text = "current team"
        pointLabel.text = "Cards left to win \(x)"
        
        
        
       //createQuestions()
       // quest.shuffle()
        newQuestion()
        newQuestion()
    //print(currentQuestion.nextQuestion().answer)
        
        
        tableView.setEditing(true, animated: true)
        
    }
    
    
    
    
    func newQuestion() {
       // asktQuestions.insert(questions.nextQuestion(), at: 0)
        questionCardLabel.text = questions.nextQuestion().quest
        

    }
    
    
    
    
    @IBAction func checkAnswer(_ sender: UIButton){
        if questions.asktQuestions.count < 8 {

            if questions.checkAnswer() {
                newQuestion()
                x -= 1
                pointLabel.text = "Cards left to win \(x)"
                tableView.reloadData()
            }
        }
        
        else{
             x -= 1
            pointLabel.text = "Cards left to win \(x)"
            showAlertAction(title: "Grattis", message: "Grattttttis")
        }
        
        
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Place the newest year at top :)"
    }
    
    func showAlertAction(title: String, message: String){
        let alert = UIAlertController(title: "Awsome!", message: "YOU HAVE ALL CARDS AND THERE FOR WON THE GAME", preferredStyle: UIAlertController.Style.alert)




        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true
        )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.asktQuestions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        let question = questions.asktQuestions[indexPath.row]
        
        
        cell.backgroundColor = UIColor.gray
        if question.active == true {
             cell.textLabel?.text = "Vilket År?"
                cell.backgroundColor = UIColor.blue
            
        } else {
            cell.textLabel?.text = questions.asktQuestions[indexPath.row].answer
            
        }
        
//        if question.previously == true{
//            cell.backgroundColor = UIColor.green
//        }
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let q = questions.asktQuestions.remove(at: sourceIndexPath.row)
        
        questions.asktQuestions.insert(q, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return asktQuestions.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        cell.textLabel?.text = asktQuestions[indexPath.row].answer
//
//                return cell
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
//
//        cell!.alpha = 0.5
//    }
    
    
    
    
    //func createQuestions(){
  //      Questions.createQuestions(Questions)
        

//        let q1 = Question(question: " fråga 1" , answer: "111" )
//        let q2 = Question(question: " fråga 2" , answer: "222" )
//        let q3 = Question(question: " fråga 3" , answer: "333" )
//        let q4 = Question(question: " fråga 4" , answer: "444" )
//        let q5 = Question(question: " fråga 5" , answer: "555" )
//        let q6 = Question(question: " fråga 6" , answer: "666" )
//        let q7 = Question(question: " fråga 7" , answer: "777" )
//        let q8 = Question(question: " fråga 8" , answer: "888" )
//
//        quest.append(q1)
//        quest.append(q2)
//        quest.append(q3)
//        quest.append(q4)
//        quest.append(q5)
//        quest.append(q6)
//        quest.append(q7)
//        quest.append(q8)
 //   }
    
   
    
    
    
    
}

