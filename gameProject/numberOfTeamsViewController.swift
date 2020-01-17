//
//  numberOfTeamsViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-15.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class numberOfTeamsViewController: UIViewController {

    
    @IBOutlet weak var team1: UIButton!
    @IBOutlet weak var team2: UIButton!
    @IBOutlet weak var team3: UIButton!
    @IBOutlet weak var team4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        team1.layer.cornerRadius = 20
        team1.layer.borderColor = UIColor.white.cgColor
        team1.layer.borderWidth = 3
        
    }

}
