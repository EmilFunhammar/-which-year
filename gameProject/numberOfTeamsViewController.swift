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
    
    var numberOfTeams = 0
    var segueToGameField = "GameField"
    var segueToTeamNames = "TeamNames"
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        team1.layer.cornerRadius = 20
        team1.layer.borderColor = UIColor.white.cgColor
        team1.layer.borderWidth = 3
        
    }
    @IBAction func teamButton1(_ sender: Any) {
        numberOfTeams = 1
        if numberOfTeams == 1{
        performSegue(withIdentifier: segueToTeamNames, sender: self)
        }
    }
    @IBAction func teamButton2(_ sender: Any) {
        numberOfTeams = 2
        if numberOfTeams == 2{
        performSegue(withIdentifier: segueToTeamNames, sender: self)
        }
    }
    @IBAction func teamButton3(_ sender: Any) {
        numberOfTeams = 3
        if numberOfTeams == 3{
        performSegue(withIdentifier: segueToTeamNames, sender: self)
        }
    }
    @IBAction func teamBUtton4(_ sender: Any) {
        numberOfTeams = 4
        if numberOfTeams == 4{
        performSegue(withIdentifier: segueToTeamNames, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             if segue.identifier == segueToTeamNames {
                let destinationVC = segue.destination as! SelectTeamNames
                 
                 destinationVC.receivingAnswer = numberOfTeams
             }
         }
    
    
    
    
}
