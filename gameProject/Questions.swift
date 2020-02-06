//
//  Questions.swift
//  gameProject
//
//  Created by oo on 2020-01-28.
//  Copyright © 2020 oo. All rights reserved.
//

import Foundation

class Questions: Question {
    
    var question : [Question] = []
    
    func createQuestions(){


        let q1 = Question(quest: "när skedde attacken mot Pearl Harbor", answer: "1941")
        let q2 = Question(quest: "11 september-attackerna", answer: "2001")
        let q3 = Question(quest: "när skedde D-dagen", answer: "1944")
        let q4 = Question(quest: "Penicillinets upptäckt", answer: "1928")
        let q5 = Question(quest: "Berlinmurens fall", answer: "1989")
        let q6 = Question(quest: "Mordet på Franz Ferdinand", answer: "1914")
        let q7 = Question(quest: "Svarta tisdagen", answer: "1929")
        let q8 = Question(quest: "Skapandet av Israel som en judisk stat", answer: "1947")
        let q9 = Question(quest: "Månlandningen", answer: "1969")
        let q10 = Question(quest: "Atombomben över Hiroshima", answer: "1945")
        let q11 = Question(quest: "Oktoberrevolutionen", answer: "1917")
        
        question.append(q1)
        question.append(q2)
        question.append(q3)
        question.append(q4)
        question.append(q5)
        question.append(q6)
        question.append(q7)
        question.append(q8)
        question.append(q9)
        question.append(q10)
        question.append(q11)
        
        
        print(q1.answer)
        print(q1.quest)
        
        
//        let q2 = Question(question: " fråga 2" , answer: "222" )
//        let q3 = Question(question: " fråga 3" , answer: "333" )
//        let q4 = Question(question: " fråga 4" , answer: "444" )
//        let q5 = Question(question: " fråga 5" , answer: "555" )
//        let q6 = Question(question: " fråga 6" , answer: "666" )
//        let q7 = Question(question: " fråga 7" , answer: "777" )
//        let q8 = Question(question: " fråga 8" , answer: "888" )
  //      quest.append(q1)
//        questions.append(q2)
//        questions.append(q3)
//        questions.append(q4)
//        questions.append(q5)
//        questions.append(q6)
//        questions.append(q7)
//        questions.append(q8)
    }
}
