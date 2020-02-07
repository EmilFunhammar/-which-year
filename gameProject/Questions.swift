//
//  Questions.swift
//  gameProject
//
//  Created by oo on 2020-01-28.
//  Copyright © 2020 oo. All rights reserved.
//

import Foundation

class Questions {
    
    var questions : [Question] = []
    var asktQuestions : [Question] = []
    var currentQuestion = 0

    
    init() {
        self.createQuestions()
    }

    
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
        
        questions.append(q1)
        questions.append(q2)
        questions.append(q3)
        questions.append(q4)
        questions.append(q5)
        questions.append(q6)
        questions.append(q7)
        questions.append(q8)
        questions.append(q9)
        questions.append(q10)
        questions.append(q11)
        
        questions.shuffle()
    }
    
    func previouslyQuestion(){
       // print(currentQuestion)
        var previousQuestion = currentQuestion
    }
    
    func nextQuestion() -> Question {
        previouslyQuestion()
        if currentQuestion >= questions.count {
            currentQuestion = 0
            print("out of questions" )
            
        }
        
        let question = questions[currentQuestion]
        currentQuestion += 1
        question.active = true
        //question.previously = true
        
        for question in asktQuestions {
            question.active = false
        }
    
        asktQuestions.insert(question, at: 0)
        
        return question
        
    }
    
    func checkAnswer() -> Bool {
        for i in 0...asktQuestions.count - 2{
            guard let answer = Int(asktQuestions[i].answer) else {return false}
            guard let nextAnswer = Int(asktQuestions[i+1].answer) else {return false}

            if answer < nextAnswer {
                print("False")
                return false
            }
        }
        print("True")
        return true
    }
    
}
