//
//  SelectTeamNames.swift
//  gameProject
//
//  Created by oo on 2020-02-07.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class SelectTeamNames: UIViewController {

    @IBOutlet weak var numberTeamLabel: UILabel!
    
    var receivingAnswer: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkRecivingAnswer()
    }
    
    func checkRecivingAnswer(){
        if receivingAnswer == nil {
            print("nothing wrong")
        }
        else{
            print(receivingAnswer!)
        }
    }

    //// kod för att if resiving anser is 4 label.hidden
    

}
