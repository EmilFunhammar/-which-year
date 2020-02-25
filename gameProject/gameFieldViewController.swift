//
//  gameFieldViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-16.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class gameFieldViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var labelBehind: UILabel!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var questionCardLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainMenu: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var showTeamCardLabel: UIButton!
    @IBOutlet weak var tableViewScore: UITableView!
    @IBOutlet weak var exitGameButton: UIButton!
    @IBOutlet weak var bigQuestionlable: UILabel!
    
    var currentTeamIndex  = 0
    var teams = [Team]()
    var currentTeam : Team!
    var i = 0
    var recivingName1 : String?
    var recivingName2 : String?
    var recivingName3 : String?
    var recivingName4 : String?
    var recivingNumber : Int?
    var myIndex = 0
    var restartGame = "restartGame"
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLooks()
        overrideUserInterfaceStyle = .light
        self.setupLabelTap()
        self.setupLabelTap1()
        self.setupLabelTap2()
        let names = [recivingName1, recivingName2, recivingName3, recivingName4]
        for i in 0..<recivingNumber! {
            teams.append(Team(name: names[i]!))
        }
        currentTeam = teams[currentTeamIndex]
        for team in teams {
            team.nextQuestion()
            team.lock()
            team.nextQuestion()
        }
        tableView.setEditing(true, animated: true)
        tableViewScore.dataSource = self
        //  tableViewScore.delegate = self
        tableView.allowsSelectionDuringEditing = true
        setNewTeam()
    }
    
    func setupLabelTap() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.dissmislabel(_:)))
        self.questionCardLabel.isUserInteractionEnabled = true
        self.questionCardLabel.addGestureRecognizer(labelTap)
    }
    
    func setupLabelTap2() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.dissmissInstruction(_:)))
        self.instructionLabel.isUserInteractionEnabled = true
        self.instructionLabel.addGestureRecognizer(labelTap)
    }
    
    func setupLabelTap1() {
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.dissmislabel(_:)))
        self.bigQuestionlable.isUserInteractionEnabled = true
        self.bigQuestionlable.addGestureRecognizer(labelTap)
    }
    
    @IBAction func dissmislabel(_ sender: UITapGestureRecognizer) {
        if bigQuestionlable.alpha == CGFloat(0){
            bigQuestionlable.alpha = 0.95
        }else{
            bigQuestionlable.alpha = 0
        }
    }
    
    @IBAction func dissmissInstruction(_ sender: UITapGestureRecognizer) {
        instructionLabel.alpha = 0
        
        
    }
    
    @IBAction func showTeamsCardCount(_ sender: Any) {
        if tableViewScore.alpha == CGFloat(0){
            showTeamCardLabel.setTitle("Vissa Poäng", for: .normal)
            tableViewScore.alpha = 1
            exitGameButton.alpha = 0
            
        }else{
            showTeamCardLabel.setTitle("Dölj Poäng", for: .normal)
            tableViewScore.alpha = 0
            exitGameButton.alpha = 1
            
        }
    }
    
    func setNewTeam() {
        teamLabel.text = currentTeam.name
        questionCardLabel.text = currentTeam.asktQuestions[0].quest
        let text = questionCardLabel.text
        bigQuestionlable.text = text
        
        
    }
    
    func newQuestion() {
        questionCardLabel.text = currentTeam.nextQuestion().quest
        let text = questionCardLabel.text
        bigQuestionlable.text = text
    }
    
    func quitGameAlert(title: String, message: String){
        let alert = UIAlertController(title: "Vill du avsluta spelet?", message: "", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ja", style: .default, handler: { (action) in
            self.exitGame()
        }))
        alert.addAction(UIAlertAction(title: "Nej", style: .default, handler: { (action) in
        }))
        self.present(alert, animated: true
        )
    }
    
    func newQuestionAlert(title: String, message: String){
        
        let answer = currentTeam.activeQuestion()!.answer
        
        let alert = UIAlertController(title: title, message: "Året var \(String(describing: answer))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Lås kort", style: .default, handler: { (action) in
            
            self.ifLockCard()
            self.tableViewScore.reloadData()
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Ny fråga", style: .default, handler: { (action) in
            
            self.ifNewQuestion()
            
            
        }))
        
        
        self.present(alert, animated: true
        )
    }
    
    func wrongAnswerAlert(title: String, message: String){
        
        let answer = currentTeam.activeQuestion()!.answer
        
        
        let alert = UIAlertController(title: title, message: "Året var \(String(describing: answer))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Nästa lag", style: .default, handler: { (action) in
            self.currentTeam.lockCards()
            self.nextTeamAlertButton()
            
            
        }))
        
        self.present(alert, animated: true)
    }
    
    func wrongAnswerAlert1Player(title: String, message: String){
        
        let answer = currentTeam.activeQuestion()!.answer
        
        let alert = UIAlertController(title: title, message: "Året var \(String(describing: answer))", preferredStyle: .alert)
        
        
        alert.addAction(UIAlertAction(title: "Ny fråga", style: .default, handler: { (action) in
            self.currentTeam.lockCards()
            self.player1Alert()
            
            
            
        }))
        
        self.present(alert, animated: true)
    }
    func player1Alert(){
        if recivingNumber == 1{
            currentTeam.nextQuestion()
            
        }
        tableView.reloadData()
        setNewTeam()
        
    }
    
    func gameWon(title: String, message: String){
        
        let answer = currentTeam.activeQuestion()!.answer
        
        let alert = UIAlertController(title: title, message: "Året var \(String(describing: answer))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Starta Nytt spel", style: .default, handler: { (action) in
            
            self.newGame()
            
        }))
        
        self.present(alert, animated: true
        )
    }
    
    func newGame(){
        performSegue(withIdentifier: restartGame, sender: self)
        
    }
    
    @IBAction func checkAnswerButton(_ sender: UIButton){
        checkAnswer()
    }
    
    func checkAnswer(){
        
        
        if currentTeam.asktQuestions.count == 8 && currentTeam.checkAnswer() == true{
            gameWon(title: "Grattis", message: "")
        }
        else if currentTeam.checkAnswer() == true{
            newQuestionAlert(title: "CORRECT!", message:"året var") /*"ÅRET VAR \(currentTeam.asktQuestions[0].answer)!                                                          Vill du låsa ditt kort eller ta en ny fråga")*/
        }
        else{
            
            
            if recivingNumber == 1{
                wrongAnswerAlert1Player(title: "Fel", message: "asfösdlödsö")
                
            }
            wrongAnswerAlert(title: "Fel", message: "Året du gisa på var fel")
        }
        
    }
    
    func ifNewQuestion(){
        if currentTeam.asktQuestions.count < 8{
            
            if currentTeam.checkAnswer() && currentTeam.asktQuestions.count != 8{
                newQuestion()
                tableView.reloadData()
                print(currentTeam.asktQuestions[0].answer)
            }
        }
        
        //        else if currentTeam.checkAnswer() == true && currentTeam.asktQuestions.count == 8{
        //            gameWon(title: "Grattis", message: "Du vann spelat")
        //
        //        }
    }
    
    func nextTeamAlertButton(){
        
        if currentTeamIndex < teams.count - 1 {
            currentTeamIndex += 1
        } else {
            currentTeamIndex = 0
        }
        
        if currentTeam.checkAnswer() == true{
            currentTeam.nextQuestion()
        }
        currentTeam = teams[currentTeamIndex]
        tableView.reloadData()
        setNewTeam()
        
    }
    
    func ifLockCard(){
        currentTeam.lockCards()
        
        if currentTeamIndex < teams.count - 1 {
            currentTeamIndex += 1
        } else {
            currentTeamIndex = 0
        }
        
        if currentTeam.checkAnswer() == true{
            currentTeam.nextQuestion()
            // print(currentTeam.asktQuestions[0].answer)
        }
        currentTeam = teams[currentTeamIndex]
        tableView.reloadData()
        setNewTeam()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.tableView {
            return currentTeam.asktQuestions.count
        } else {
            return teams.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if ( tableView == self.tableView) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
            
            let question = currentTeam.asktQuestions[indexPath.row]
            
            cell.backgroundColor = UIColor(red: 0.290, green: 0.710, blue: 1.000, alpha: 1.0)
            cell.layer.cornerRadius = 20
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.systemYellow.cgColor
            //cell.translatesAutoresizingMaskIntoConstraints = false
            
            if question.locked == true{
                cell.backgroundColor = UIColor(red: 0.350, green: 0.810, blue: 0.190, alpha: 1.0)
            }
            
            if question.active == true {
                cell.textLabel?.text = "Vilket år var det!?"
                cell.backgroundColor = UIColor(red: 0.930, green: 0.280, blue: 0.200, alpha: 1.0)
            } else {
                cell.textLabel?.text = currentTeam.asktQuestions[indexPath.row].answer
                
                
            }
            
            return cell
        } else {
            let cell = tableViewScore.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            
            //                teams[0].name
            //                teams[0].asktQuestions.count
            let String1 = teams[indexPath.row].name
            let String2 = teams[indexPath.row].asktQuestions.count - 1
            let String3  = String1 + " har " + String(String2) + " Poäng"
            
            cell.textLabel!.text = String3
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return UITableViewCell.EditingStyle.none
        
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        let quest = currentTeam.asktQuestions[sourceIndexPath.row]
        
        
        if quest.active == true {
            
            
            let q =  currentTeam.asktQuestions.remove(at: sourceIndexPath.row)
            // let q = currentTeam.asktQuestions.remove(at: sourceIndexPath.row)
            
            
            currentTeam.asktQuestions.insert(q, at: destinationIndexPath.row)
            
        }
        else{print("inne i else")
            
            
        }
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == self.tableView) {
            myIndex = indexPath.row
            print(currentTeam.asktQuestions[myIndex].quest)
            questionCardLabel.text = currentTeam.asktQuestions[myIndex].quest
            let text = questionCardLabel.text
            bigQuestionlable.text = text
        }
    }
    
    @IBAction func instructionButton(_ sender: Any) {
        if instructionLabel.alpha == CGFloat(0){
            instructionLabel.text = "👉Den blåa ettiketen idikerar på vilket lag som ska spela omgången\n👉Den gröna kanappen vissar hur många kort/poäng motståndarlagen har på sin spelplan\n👉Du placerar det aktiva åtalet genom att hålla på det randiga fältet och placera ditt svar mellan de rätta årtalen\n👉Trycker du på det aktuella frågekortet kommer frågan upp i en ny ruta med större format för lättare läsning, För att återgå till spelets ursprungsläge trycker du på frågerkortet\n👉spelet går ut på att svara på vilket årtal som händelsen inträffat. Du placerar kortet som hänvisar till en händelse mellan dem tidigare vunna korten, det årtalet som inträffat närmst i tid placeras högst upp på tidslinjen. Blir du osäker på vart du ska placera ditt kort kan du ta hjälp av att läsa dina tidigare frågeställningar. Detta gör du genom att trycka på respektive årtal. Det lag som först uppnår 8 korrekt svarade kort har vunnit.\n👉Tips: Streama spelat till en större bildskärm förr en bättre spelupplevelse. spelet anpassas för alla åldrar så bjud in alla du känner för en trevlig spelkväll!😄"
            instructionLabel.alpha = 0.95
            mainMenu.setTitle("Dölj instruktioner", for: .normal)
        }
        else {
            instructionLabel.alpha = 0
            mainMenu.setTitle("Instruktioner", for: .normal)
            
        }
        
    }
    @IBAction func exitGame(_ sender: Any) {
        quitGameAlert(title: "", message: "")
        
    }
    func exitGame(){
        performSegue(withIdentifier: restartGame, sender: self)
    }
    //        @IBAction func mainMenu(_ sender: Any) {
    //         performSegue(withIdentifier: restartGame, sender: self)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == restartGame{
            _ = segue.destination as!
            ViewController
        }
    }
    //EB4937 red: 0.92, green: 0.29, blue: 0.22
    
    func displayLooks(){
        labelBehind.layer.borderWidth = 15
        labelBehind.layer.borderColor = UIColor(red: 0.930, green: 0.280, blue: 0.200, alpha: 1.0).cgColor
        labelBehind.layer.cornerRadius = 20
        labelBehind.layer.masksToBounds = true
        
        showTeamCardLabel.layer.borderWidth = 3
        showTeamCardLabel.setTitle("Poäng tavla", for: .normal)
        showTeamCardLabel.layer.cornerRadius = 10
        showTeamCardLabel.layer.borderColor = UIColor.black.cgColor
        
        teamLabel.layer.cornerRadius = 10
        teamLabel.layer.masksToBounds = true
        
        answerButton.layer.borderWidth = 3
        answerButton.layer.borderColor = UIColor.black.cgColor
        answerButton.layer.cornerRadius = 10
        answerButton.setTitle("Lås ditt Svar!", for: .normal)
        
        mainMenu.layer.borderWidth = 3
        mainMenu.layer.borderColor = UIColor.black.cgColor
        mainMenu.layer.cornerRadius = 10
        mainMenu.setTitle("Instruktioner", for: .normal)
        
        instructionLabel.layer.masksToBounds = true
        instructionLabel.layer.borderWidth = 3
        instructionLabel.layer.borderColor = UIColor.black.cgColor
        instructionLabel.layer.cornerRadius = 10
        instructionLabel.layer.masksToBounds = true
        
        exitGameButton.layer.borderWidth = 3
        exitGameButton.layer.borderColor = UIColor.black.cgColor
        exitGameButton.layer.cornerRadius = 10
        exitGameButton.setTitle("Avsluta Spelet", for: .normal)
        
        bigQuestionlable.layer.masksToBounds = true
        bigQuestionlable.layer.cornerRadius = 50
        bigQuestionlable.layer.borderWidth = 10
        bigQuestionlable.layer.borderColor = UIColor.black.cgColor
        bigQuestionlable.textAlignment = .center
        // bigQuestionlable.adjustsFontSizeToFitWidth = true
        // bigQuestionlable.allowsDefaultTighteningForTruncation = true
        // bigQuestionlable.preferredMaxLayoutWidth = 50
        
        tableView.backgroundColor = UIColor.systemYellow
        
    
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
}

