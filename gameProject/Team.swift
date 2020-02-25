//
//  Questions.swift
//  gameProject
//
//  Created by oo on 2020-01-28.
//  Copyright © 2020 oo. All rights reserved.
//

import Foundation

class Team {
    
    private static var allQuestions : [Question]?
    //private static var categoriQuestion : [Question]?
    var questions : [Question] = []
    var asktQuestions : [Question] = []
    var currentQuestion = 0
    var name : String
    
    
    
    init(name: String) {
        self.name = name
        if let allQuesttions = Team.allQuestions {} else {
            createQuestions()
        }
        
        self.choseQuestions()
    }
    
    func createQuestions() {
        
        Team.allQuestions = [Question]()
        let q1 = Question(quest: " när skedde attacken mot Pearl Harbor", answer: "1941")
        let q2 = Question(quest: " 11 september-attackerna", answer: "2001")
        let q3 = Question(quest: " när skedde D-dagen", answer: "1944")
        let q4 = Question(quest: "Penicillinets upptäckt", answer: "1928")
        let q5 = Question(quest: "Berlinmurens fall", answer: "1989")
        let q6 = Question(quest: "Mordet på Franz Ferdinand", answer: "1914")
        let q7 = Question(quest: "Svarta tisdagen", answer: "1929")
        let q8 = Question(quest: "Skapandet av Israel som en judisk stat", answer: "1947")
        let q9 = Question(quest: "Månlandningen", answer: "1969")
        let q10 = Question(quest: "Atombomben över Hiroshima", answer: "1945")

        let q11 = Question(quest: "Oktoberrevolutionen", answer: "1917")
        let q12 = Question(quest: "Tyske forskaren Otto von Guericke visar att luften har ett tryck", answer: "1650")
        let q13 = Question(quest: "Amrikanska Annie Malone konstruerar en platttång", answer: "1905")
        let q14 = Question(quest: "Joseph Sheridan uppfinner Irish Coffee för att värma frusna flygpassagerare på Foynes Airport på Irland", answer: "1943")
        let q15 = Question(quest: "Great Northern Railways järnväg över hela Nordamerika blir klar", answer: "1893")
        let q16 = Question(quest: "Den berömnda schweiziska armekniven börjar tillverkas", answer: "1891")
        let q17 = Question(quest: "Gräddbollen Munms-Mums börjar tillverkas", answer: "1933")
        //!let q18 = Question(quest: "Nyhetsprogrammet Rapport sänds för första gången", answer: "")
        let q19 = Question(quest: "DVD-skivor och DVD-spelare börjas säljas i Europa", answer: "1998")
        let q20 = Question(quest: "Det första äkta porslinet i Europa", answer: "1709")

        let q21 = Question(quest: "Skotten William Symington bygger den första fungerande ångbåten", answer: "1788")
        let q22 = Question(quest: "William Painter får patent på ölkapsylen", answer: "1892")
        let q23 = Question(quest: "Företaget Apple lanserar App Store där man kan köpa olika appar till iphone eller ipad", answer: "2008")
        let q24 = Question(quest: "Chokladen After Eight lanseras", answer: "1962")
        let q25 = Question(quest: "Svenska kvinnor får rätt att utbilda sig till folkskollärare", answer: "1853")
        let q26 = Question(quest: "Ramlösa Brunns hälsokälla invigss officiellt", answer: "1707")
        let q27 = Question(quest: "Den första svenska filmen spelas in", answer: "1897")
        let q28 = Question(quest: "Sadelmakaren Per Adolf Jansson tillverkar den första Hästen-sängen någonsin", answer: "1852")
        
        
        
        let q29 = Question(quest: "Danske Lene Vestergaard Hau och hennes forskar team vid Harvard lyckas stanna ljuset", answer: "2001")
        let q30 = Question(quest: "Svenske Waldemar Jungner får patent på ett nickel.järnbatteri, två år innen Edison tar patent på samma sak. Edison vinner senare patenttvinsten eftersom han har mer pengar ", answer: "1899")
        
        Team.allQuestions?.append(q1); Team.allQuestions?.append(q2); Team.allQuestions?.append(q3);
        Team.allQuestions?.append(q4); Team.allQuestions?.append(q5); Team.allQuestions?.append(q6); Team.allQuestions?.append(q7); Team.allQuestions?.append(q8); Team.allQuestions?.append(q9); Team.allQuestions?.append(q10); Team.allQuestions?.append(q11); Team.allQuestions?.append(q12); Team.allQuestions?.append(q13); Team.allQuestions?.append(q14); Team.allQuestions?.append(q15); Team.allQuestions?.append(q16); Team.allQuestions?.append(q17); /*Team.allQuestions?.append(q18);*/ Team.allQuestions?.append(q19); Team.allQuestions?.append(q20); Team.allQuestions?.append(q21); Team.allQuestions?.append(q22); Team.allQuestions?.append(q23); Team.allQuestions?.append(q24); Team.allQuestions?.append(q25); Team.allQuestions?.append(q26); Team.allQuestions?.append(q27); Team.allQuestions?.append(q28); Team.allQuestions?.append(q29); Team.allQuestions?.append(q30)
        
        
        
        Team.allQuestions?.append(q29); Team.allQuestions?.append(q30)
        Team.allQuestions?.shuffle()
        
       // print("!!!!!!!!!!!! creating questions: \(Team.allQuestions?.count)")
        
    }
    
    
    
    func choseQuestions(){
        for i in 0...6
{
    print(questions)
            if Team.allQuestions?.count == 0 {
                return
            }
        
            if let q = Team.allQuestions?[0] {
                Team.allQuestions?.remove(at: 0)
                questions.append(q)
            }
          //  questions.insert(contentsOf: Team.allQuestions!, at: i)
            //Team.allQuestions?.remove(at: i)
   // print("!!!\(questions)")
        }
        
        //print("!!!!!!!!Added questions to team: \(Team.allQuestions?.count)")

        // instert
        // remove
        // loppa så många frågar man villha
        
        
        
    }
    
    func nextQuestion() -> Question {
        //previouslyQuestion()
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
    // är det korrekt?
    func checkAnswer() -> Bool {
        for i in 0..<asktQuestions.count {
            
            guard let answer = Int(asktQuestions[i].answer) else {return false}
            
            if i != asktQuestions.count - 1 {
                guard let nextAnswer = Int(asktQuestions[i+1].answer) else {return false}
                
                if answer < nextAnswer {
                    print("False")
                    return false
                    
                }}
        }
        print("True")
        return true
    }
    //
    
    func lockCards() {
        let lock = checkAnswer()
        
        
        for index in (0..<asktQuestions.count).reversed() {
            if (lock) {
                asktQuestions[index].locked = true
            } else {
                if asktQuestions[index].locked == false{
                    asktQuestions.remove(at: index)
                }
            }
        }
    }
    
    func lock(){
        asktQuestions[0].locked = true
    }
    
    func activeQuestion() -> Question? {
        print("!!! count: \(asktQuestions.count)")
        
        for question in asktQuestions {
            print("!!! active: \(question.active)")
            if question.active {
                return question
            }
        }
        print("no active question")
        
        return nil
    }

}
