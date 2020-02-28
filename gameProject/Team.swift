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
    private static var questionCount = 0
    private static var isQuestionEmpty = false
    var questions : [Question] = []
    var asktQuestions : [Question] = []
    var currentQuestion = 0
    var name : String
    var nrOfTeams : Int?
    var outOfQuestionsBool : Bool
    
    
    
    
    
    init(name: String, nrOfTeams: Int) {
        self.name = name
        outOfQuestionsBool = false
        if let allQuesttions = Team.allQuestions {} else {
            createQuestions()
        }
        
        self.choseQuestions(nrOfTeams )
    }
    
    //    func clear() {
    //        Team.allQuestions?.removeAll()
    //        Team.allQuestions = nil
    //
    //    }
    
    //    func newQuestionsToTeams(nrOfTeams: Int){
    //        if Team.isQuestionEmpty == false{
    //            print("emil: newQuestionToTeams")
    //            clear()
    //            createQuestions()
    //            currentQuestion = 0
    //            Team.isQuestionEmpty = true
    //        }else{
    //
    //        }
    //        currentQuestion = 0
    //        choseQuestions(nrOfTeams)
    //    }
    
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
        let q18 = Question(quest: "Nyhetsprogrammet Rapport sänds för första gången", answer: "1966")
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
        let q31 = Question(quest: "Maffiabossen Al Capone föds i Brooklyn, New York", answer: "1899")
        let q32 = Question(quest: "Coop i Sverige lanserar det egna lågprismärket Blåvitt", answer: "1979")
        let q33 = Question(quest: "Slussen i Stockholm invigs", answer: "1935")
        let q34 = Question(quest: "Fransmannen Regis Cadier öppnar Grand Hotel I Stockholm", answer: "1874")
        let q35 = Question(quest: "Diggerdöden drabbar för första gången Europa", answer: "1340")
        let q36 = Question(quest: "Kung Gustaf V:s chaufför kör av vägen söder om stockholm. Platsen för händelsen kommer få namnet Kungens kurva", answer: "1946")
        let q37 = Question(quest: "Jhon F Kennedy blir Mördad i Dallas", answer: "1963")
        let q38 = Question(quest: "Stockholm Pride äger rum för första gången", answer: "1998")
        let q39 = Question(quest: "Aurora Liljenroth blir första kvinnan i Sverige att ta studenten", answer: "1788")
        let q40 = Question(quest: "Sveriges första kinaresturang, Kinesiska muren, öppnar i Göteborg", answer: "1961")
        let q41 = Question(quest: "Ingmar 'Ingo' johansson blir världsmästare i tungviktsboxning", answer: "1959")
        let q42 = Question(quest: "vasaloppet ställs in på grund av snöbrist. Det blir försa gången sedan 1934", answer: "1990")
        let q43 = Question(quest: "Michelingubben kommer till som maskot på en utställning i franska Lyon", answer: "1894")
        let q44 = Question(quest: "Skidskytten Björn Ferry tar guld i jaktstarten i OS i Vancouver", answer: "2010")
        let q45 = Question(quest: "Per Udden grundar sitt bolag och börjar tillverka permobiler", answer: "1963")
        let q46 = Question(quest: "Det första moderna flipperspelet,  Humpty Dumpty, kommer till marknaden", answer: "1947")
//        let q47 = Question(quest: "Tåget till Arlanda, Arlandabanan invigs", answer: "1999")
//        let q48 = Question(quest: "Ray jacuzzi uppfinner spabadet", answer: "1968")
//        let q49 = Question(quest: "13 brittiska kolonier i NordAmerika förklarar sig självständiga 4 juli detta år och bildar unionen USA", answer: "1776")
//        let q50 = Question(quest: "Gameern Billy Mitchell blir den första att klara av alla 255 nivåerna i Pacman", answer: "1999")
//        let q51 = Question(quest: "Anna-karin erkänner att emil är hennes bästa barn", answer: "2005")
//        let q52 = Question(quest: "Bengt 'Bengan' Johansson blir förbundskapten för svenska herrlandslaget i handboll", answer: "")
//        let q53 = Question(quest: "Biskop Peter Elofsson i Västerås återköper en åttondel av falu koppargruva", answer: "1280")
//        let q54 = Question(quest: "Kosterhavet blir Sveriges första marina nationalpark och invigs av kung Carl XVI Gustaf", answer: "2009")
//        let q55 = Question(quest: "", answer: "")
//        let q56 = Question(quest: "", answer: "")
//        let q57 = Question(quest: "", answer: "")
//        let q58 = Question(quest: "", answer: "")
//        let q59 = Question(quest: "", answer: "")
//        let q60 = Question(quest: "", answer: "")
//        let q61 = Question(quest: "", answer: "")
//        let q62 = Question(quest: "", answer: "")
//        let q63 = Question(quest: "", answer: "")
//        let q64 = Question(quest: "", answer: "")
//        let q65 = Question(quest: "", answer: "")
//        let q66 = Question(quest: "", answer: "")
//        let q67 = Question(quest: "", answer: "")
//        let q68 = Question(quest: "", answer: "")
//        let q69 = Question(quest: "", answer: "")
//        let q70 = Question(quest: "", answer: "")
//        let q71 = Question(quest: "", answer: "")
//        let q72 = Question(quest: "", answer: "")
//        let q73 = Question(quest: "", answer: "")
//        let q74 = Question(quest: "", answer: "")
//        let q75 = Question(quest: "", answer: "")
//        let q76 = Question(quest: "", answer: "")
//        let q77 = Question(quest: "", answer: "")
//        let q78 = Question(quest: "", answer: "")
//        let q79 = Question(quest: "", answer: "")
//        let q80 = Question(quest: "", answer: "")
//        let q81 = Question(quest: "", answer: "")
//        let q82 = Question(quest: "", answer: "")
//        let q83 = Question(quest: "", answer: "")
//        let q84 = Question(quest: "", answer: "")
//        let q85 = Question(quest: "", answer: "")
//        let q86 = Question(quest: "", answer: "")
//        let q87 = Question(quest: "", answer: "")
//        let q88 = Question(quest: "", answer: "")
//        let q89 = Question(quest: "", answer: "")
//        let q90 = Question(quest: "", answer: "")
//        let q91 = Question(quest: "", answer: "")
//        let q92 = Question(quest: "", answer: "")
//        let q93 = Question(quest: "", answer: "")
//        let q94 = Question(quest: "", answer: "")
//        let q95 = Question(quest: "", answer: "")
//        let q96 = Question(quest: "", answer: "")
//        let q97 = Question(quest: "", answer: "")
//        let q98 = Question(quest: "", answer: "")
//        let q99 = Question(quest: "", answer: "")
//        let q100 = Question(quest: "", answer: "")
        
        Team.allQuestions?.append(q1); Team.allQuestions?.append(q2); Team.allQuestions?.append(q3);
        Team.allQuestions?.append(q4); Team.allQuestions?.append(q5); Team.allQuestions?.append(q6); Team.allQuestions?.append(q7); Team.allQuestions?.append(q8); Team.allQuestions?.append(q9); Team.allQuestions?.append(q10); Team.allQuestions?.append(q11); Team.allQuestions?.append(q12); Team.allQuestions?.append(q13); Team.allQuestions?.append(q14); Team.allQuestions?.append(q15); Team.allQuestions?.append(q16); Team.allQuestions?.append(q17); Team.allQuestions?.append(q18); Team.allQuestions?.append(q19); Team.allQuestions?.append(q20); Team.allQuestions?.append(q21); Team.allQuestions?.append(q22); Team.allQuestions?.append(q23); Team.allQuestions?.append(q24); Team.allQuestions?.append(q25); Team.allQuestions?.append(q26); Team.allQuestions?.append(q27); Team.allQuestions?.append(q28); Team.allQuestions?.append(q29); Team.allQuestions?.append(q30)
        Team.allQuestions?.append(q31); Team.allQuestions?.append(q32); Team.allQuestions?.append(q33); Team.allQuestions?.append(q34); Team.allQuestions?.append(q35); Team.allQuestions?.append(q36); Team.allQuestions?.append(q37); Team.allQuestions?.append(q38); Team.allQuestions?.append(q39); Team.allQuestions?.append(q40); Team.allQuestions?.append(q41); Team.allQuestions?.append(q42); Team.allQuestions?.append(q43); Team.allQuestions?.append(q44); Team.allQuestions?.append(q45); Team.allQuestions?.append(q46); //Team.allQuestions?.append(q47); Team.allQuestions?.append(q48); Team.allQuestions?.append(q49); Team.allQuestions?.append(q50); Team.allQuestions?.append(q51)
//        Team.allQuestions?.append(q52); Team.allQuestions?.append(q53); Team.allQuestions?.append(q54); Team.allQuestions?.append(q55); Team.allQuestions?.append(q56); Team.allQuestions?.append(q57); Team.allQuestions?.append(q58); Team.allQuestions?.append(q59); Team.allQuestions?.append(q60); Team.allQuestions?.append(q61); Team.allQuestions?.append(q62); Team.allQuestions?.append(q63); Team.allQuestions?.append(q64); Team.allQuestions?.append(q65); Team.allQuestions?.append(q66); Team.allQuestions?.append(q67); Team.allQuestions?.append(q68); Team.allQuestions?.append(q69); Team.allQuestions?.append(q70); Team.allQuestions?.append(q71); Team.allQuestions?.append(q72);
//        Team.allQuestions?.append(q73); Team.allQuestions?.append(q74); Team.allQuestions?.append(q75); Team.allQuestions?.append(q76); Team.allQuestions?.append(q77); Team.allQuestions?.append(q78); Team.allQuestions?.append(q79); Team.allQuestions?.append(q80); Team.allQuestions?.append(q81); Team.allQuestions?.append(q82); Team.allQuestions?.append(q83); Team.allQuestions?.append(q84); Team.allQuestions?.append(q85); Team.allQuestions?.append(q86); Team.allQuestions?.append(q87); Team.allQuestions?.append(q88); Team.allQuestions?.append(q89); Team.allQuestions?.append(q90); Team.allQuestions?.append(q91); Team.allQuestions?.append(q92); Team.allQuestions?.append(q93);
//        Team.allQuestions?.append(q94); Team.allQuestions?.append(q95); Team.allQuestions?.append(q96); Team.allQuestions?.append(q97); Team.allQuestions?.append(q98); Team.allQuestions?.append(q99);
//        Team.allQuestions?.append(q100);
        
        Team.allQuestions?.shuffle()
        
        Team.questionCount = Team.allQuestions!.count
    }
    
    func choseQuestions(_ nrOfTeams: Int){
        let nr = Team.questionCount / nrOfTeams
        for i in 0..<nr
        {
            if Team.allQuestions?.count == 0 {
                return
            }
            
            if let q = Team.allQuestions?[0] {
                Team.allQuestions?.remove(at: 0)
                questions.append(q)
            }
        }
        print("räkna \(questions.count)")
    }
    func outOfQuestions(){
        outOfQuestionsBool = true
    }
    
    func nextQuestion() -> Question {
        if currentQuestion >= questions.count {
            currentQuestion = 0
            outOfQuestions()
            print("emil: out of questions in Team" )
        }
        
        let question = questions[currentQuestion]
        currentQuestion += 1
        question.active = true
        
        for question in asktQuestions {
            question.active = false
        }
        
        asktQuestions.insert(question, at: 0)
        
        return question
        
    }
    func checkAnswer() -> Bool {
        for i in 0..<asktQuestions.count {
            
            guard let answer = Int(asktQuestions[i].answer) else {return false}
            
            if i != asktQuestions.count - 1 {
                guard let nextAnswer = Int(asktQuestions[i+1].answer) else {return false}
                
                if answer < nextAnswer {
                    //print("False")
                    return false
                }
            }
        }
        return true
    }
    
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
        for question in asktQuestions {
            if question.active {
                return question
            }
        }
        return nil
    }
    
}
