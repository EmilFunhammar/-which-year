//
//  ViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-14.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLooks()
        
    }
    
    func buttonLooks() {
        playButton.layer.cornerRadius = 20
        playButton.layer.borderColor = UIColor.white.cgColor
        playButton.layer.borderWidth = 3
        teamButton.layer.cornerRadius = 20
        teamButton.layer.borderColor = UIColor.white.cgColor
        teamButton.layer.borderWidth = 3
        settingsButton.layer.cornerRadius = 20
        settingsButton.layer.borderColor = UIColor.white.cgColor
        settingsButton.layer.borderWidth = 3
    }


}

