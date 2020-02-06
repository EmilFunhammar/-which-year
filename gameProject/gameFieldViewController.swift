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
    @IBOutlet weak var catagoriLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var question : [Questions] = []
    var asktQuestions : [Questions] = []
    var currentQuestion = 0
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       createQuestions()
       // quest.shuffle()
        newQuestion()
        newQuestion()
        
        
        
        
        tableView.setEditing(true, animated: true)
        
    }
    
    
    func newQuestion() {
        asktQuestions.insert(question[currentQuestion], at: 0)
        currentQuestion += 1
        questionCardLabel.text = asktQuestions[0].quest
        

    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        var qcheck = false
        var count = 0
        for i in 0...asktQuestions.count{
            if (i+1) < asktQuestions.count && asktQuestions[i].answer < asktQuestions[i+1].answer {
                count += 1
                print("\(asktQuestions[i].answer) is correct")
                if count == (asktQuestions.count - 1){
                    qcheck = true
                    print("Print new question")
                    break
                }
            }
            else{
                print("\(asktQuestions[i].answer) är fel")
                break
            }
        }
        
        if qcheck == true{
            newQuestion()
            tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asktQuestions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        
        cell.textLabel?.text = asktQuestions[indexPath.row].answer
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let q = asktQuestions.remove(at: sourceIndexPath.row)
        
        asktQuestions.insert(q, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func createQuestions(){
        
        

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
    }
    
   
    
    
    
    
}

