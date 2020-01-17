//
//  gameFieldViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-16.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class gameFieldViewController: UIViewController {
    
    @IBOutlet weak var cardLabel: UILabel!
    
    @IBOutlet weak var startCard: UILabel!
    
    private var questions = [Question]()
// array består av objekt av classen Question.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createQuestions()
        cardLabel.text = questions[2].quest
        startCard.text = questions[1].answer
        
        //print(questions[0].quest)
       // print(questions[0].answer)

    }

    
    func createQuestions(){
        let q1 = Question(question: " fråga 1 " , answer: "111" )
        questions.append(q1)
        let q2 = Question(question: " fråga 2" , answer: "222" )
               questions.append(q2)
        let q3 = Question(question: " fråga 3" , answer: "333" )
               questions.append(q3)
    }
    

}
