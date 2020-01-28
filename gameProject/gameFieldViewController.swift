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
    
    @IBOutlet weak var stackView: UIStackView!
//    @IBOutlet weak var cardLabel1: UILabel!
//    @IBOutlet weak var cardLabel2: UILabel!
//    @IBOutlet weak var cardLabel3: UILabel!
//    @IBOutlet weak var cardLabel4: UILabel!
//    @IBOutlet weak var cardLabel5: UILabel!
//    @IBOutlet weak var cardLabel6: UILabel!
//    @IBOutlet weak var cardLabel7: UILabel!
//    @IBOutlet weak var cardLabel8: UILabel!
    
    
    private var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createQuestions()
        questions.shuffle()
        dump(questions)
        
       
        
       
        let firstPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let secondPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let thirdPalaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let fourthPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let fiftPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let sixtPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let seventhPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let eightPlaceTapGesture = UITapGestureRecognizer(target:self,action:#selector(self.tapReconizer))
        
        let firstPlace = UILabel.init()
            firstPlace.text = questions[0].answer
            firstPlace.backgroundColor = .gray
            firstPlace.isUserInteractionEnabled = true
            firstPlace.addGestureRecognizer(firstPlaceTapGesture)
        
        let secondPlace = UILabel.init()
            secondPlace.text = "2"
            secondPlace.isUserInteractionEnabled = true
            secondPlace.addGestureRecognizer(secondPlaceTapGesture)
        
        let thirdPlace = UILabel.init()
            thirdPlace.text = "3"
            thirdPlace.isUserInteractionEnabled = true
            thirdPlace.addGestureRecognizer(thirdPalaceTapGesture)
        
        let fourthPlace = UILabel.init()
            fourthPlace.text = "4"
            fourthPlace.isUserInteractionEnabled = true
            fourthPlace.addGestureRecognizer(fourthPlaceTapGesture)
        
        let fiftPlace = UILabel.init()
            fiftPlace.text = "5"
            fiftPlace.isUserInteractionEnabled = true
            fiftPlace.addGestureRecognizer(fiftPlaceTapGesture)
        
        let sixtPlace = UILabel.init()
            sixtPlace.text = "6"
            sixtPlace.isUserInteractionEnabled = true
            sixtPlace.addGestureRecognizer(sixtPlaceTapGesture)
        
        let seventhPlace = UILabel.init()
            seventhPlace.text = "7"
            seventhPlace.isUserInteractionEnabled = true
            seventhPlace.addGestureRecognizer(seventhPlaceTapGesture)
        
        let eightPlace = UILabel.init()
            eightPlace.text = "Vilket år"
            eightPlace.backgroundColor = .blue
            eightPlace.isUserInteractionEnabled = true
            eightPlace.addGestureRecognizer(eightPlaceTapGesture)

        
        let stackView = UIStackView.init()
        
        self.stackView.addSubview(stackView)
        self.stackView.addArrangedSubview(firstPlace)
        self.stackView.addArrangedSubview(secondPlace)
        self.stackView.addArrangedSubview(thirdPlace)
        self.stackView.addArrangedSubview(fourthPlace)
        //self.stackView.addArrangedSubview(fiftPlace)
        //self.stackView.addArrangedSubview(sixtPlace)
        //self.stackView.addArrangedSubview(seventhPlace)
        //self.stackView.addArrangedSubview(eightPlace)
        
        stackView.axis = .horizontal
       
        stackView.distribution = .fill//.fillEqually.fillProportionally.equalSpacing
        
//        stackView.addArrangedSubview(firstPlace)
            cardLabel.text = questions[1].quest
//            cardLabel1.text = questions[0].answer
//            cardLabel2.text = questions[1].answer
//            cardLabel3.text = questions[2].quest
//            cardLabel4.text = questions[3].answer
//            cardLabel5.text = questions[4].answer
//            cardLabel6.text = questions[5].answer
//            cardLabel7.text = questions[6].answer
//            cardLabel8.text = questions[7].answer
//
       // startCard.text = questions[1].answer

    }
        // func c (Questions: [])
    
//    func createQuestions(){
//
//        let q1 = Question(question: " fråga 1" , answer: "111" )
//        let q2 = Question(question: " fråga 2" , answer: "222" )
//        let q3 = Question(question: " fråga 3" , answer: "333" )
//        let q4 = Question(question: " fråga 4" , answer: "444" )
//        let q5 = Question(question: " fråga 5" , answer: "555" )
//        let q6 = Question(question: " fråga 6" , answer: "666" )
//        let q7 = Question(question: " fråga 7" , answer: "777" )
//        let q8 = Question(question: " fråga 8" , answer: "888" )
//        questions.append(q1)
//        questions.append(q2)
//        questions.append(q3)
//        questions.append(q4)
//        questions.append(q5)
//        questions.append(q6)
//        questions.append(q7)
//        questions.append(q8)
//    }
    
    
    @IBAction func tapReconizer(_ sender: UITapGestureRecognizer){
        
        let index = stackView.arrangedSubviews.firstIndex(of: sender.view!)
//
        let answerIndex = stackView.arrangedSubviews.count-1
        let view = stackView.arrangedSubviews[answerIndex]
        
        stackView.removeArrangedSubview(view)
        
        
       stackView.insertArrangedSubview(view, at: index!)
        
        print("Tappt")
        
    }
    
    
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        
    }
    
    
}
