//
//  Questions.swift
//  gameProject
//
//  Created by oo on 2020-01-28.
//  Copyright © 2020 oo. All rights reserved.
//

import Foundation

class Questions: gameFieldViewController {
    
    
    override func createQuestions(){
        
        let q1 = Question(question: " fråga 1" , answer: "111" )
        let q2 = Question(question: " fråga 2" , answer: "222" )
        let q3 = Question(question: " fråga 3" , answer: "333" )
        let q4 = Question(question: " fråga 4" , answer: "444" )
        let q5 = Question(question: " fråga 5" , answer: "555" )
        let q6 = Question(question: " fråga 6" , answer: "666" )
        let q7 = Question(question: " fråga 7" , answer: "777" )
        let q8 = Question(question: " fråga 8" , answer: "888" )
        questions.append(q1)
        questions.append(q2)
        questions.append(q3)
        questions.append(q4)
        questions.append(q5)
        questions.append(q6)
        questions.append(q7)
        questions.append(q8)
    }
}
