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
    
    var recivingtext: String?
    var recivingBool: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLooks()
        overrideUserInterfaceStyle = .light
        checkrecivingtext()
    }
    
    func checkrecivingtext(){
        playButton.setTitle(recivingtext, for: .normal)
    }
        
    func buttonLooks() {
        playButton.alpha = 0
        playButton.layer.cornerRadius = 20
        playButton.layer.borderColor = UIColor.black.cgColor
        playButton.layer.borderWidth = 3
        
        teamButton.layer.cornerRadius = 20
        teamButton.layer.borderColor = UIColor.black.cgColor
        teamButton.layer.borderWidth = 3
    }
    
    @IBAction func unwindToStart(segue: UIStoryboardSegue){
    }
}

