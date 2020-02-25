//
//  Question.swift
//  gameProject
//
//  Created by oo on 2020-01-16.
//  Copyright © 2020 oo. All rights reserved.
//

import Foundation

class Question{
    
    var quest : String
    var answer : String
    var active : Bool
    var previously : Bool
    var locked : Bool
    
    init (quest: String, answer: String){
        self.quest = quest
        self.answer = answer
        active = false
        previously = false
        locked = false
    }
    
}
