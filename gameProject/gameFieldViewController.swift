//
//  gameFieldViewController.swift
//  gameProject
//
//  Created by oo on 2020-01-16.
//  Copyright © 2020 oo. All rights reserved.
//

import UIKit

class gameFieldViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var questionCardLabel: UITextView!
    @IBOutlet weak var bigQuestionlable: UITextView!
    @IBOutlet weak var instructionLabel: UITextView!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainMenu: UIButton!
    @IBOutlet weak var showTeamCardLabel: UIButton!
    @IBOutlet weak var tableViewScore: UITableView!
    @IBOutlet weak var exitGameButton: UIButton!
    
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
            teams.append(Team(name: names[i]!, nrOfTeams: recivingNumber!))
        }
        currentTeam = teams[currentTeamIndex]
        for team in teams {
            team.nextQuestion()
            team.lock()
            team.nextQuestion()
             print("!!!!\(team.questions.count)")
        }
        tableView.setEditing(true, animated: true)
        tableViewScore.dataSource = self
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

        teamLabel.text = "Din tur! " + currentTeam.name
        questionCardLabel.text = currentTeam.asktQuestions[0].quest
        let text = questionCardLabel.text
        bigQuestionlable.text = text
        print("!!!!\(currentTeam.asktQuestions[0].answer)")
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
    
    func outOfQuestionsAlert(title: String, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Avsluta spel", style: .default, handler: { (action) in
            self.exitGame()
        }))
        
        self.present(alert, animated: true)
    }
    
    func outOfQuestions(){
        if currentTeam.outOfQuestionsBool == true{
            outOfQuestionsAlert(title: "Slut på kort", message: "Tyvärr lyckades du inte få 8 poäng innan korten tog slut")
        }
    }
    
    func gameWon(title: String, message: String){
        
        let answer = currentTeam.activeQuestion()!.answer
        
        let alert = UIAlertController(title: title, message: "Året var \(String(describing: answer))", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Starta Nytt spel", style: .default, handler: { (action) in
            
            self.exitGame()
            
        }))
        
        self.present(alert, animated: true
        )
    }
    
    @IBAction func checkAnswerButton(_ sender: UIButton){
        checkAnswer()
        
    }
    
    func checkAnswer(){
        
        if currentTeam.asktQuestions.count == 8 && currentTeam.checkAnswer() == true{
            gameWon(title: "Grattis", message: "")
        }
        else if currentTeam.checkAnswer() == true{
            newQuestionAlert(title: "CORRECT!", message:"året var")
            
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
                print("!!!!\(currentTeam.asktQuestions[0].answer)")
            }
        }
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
            cell.layer.cornerRadius = 13
            cell.layer.borderWidth = 2
            cell.layer.borderColor = UIColor.systemYellow.cgColor
            if question.locked == true{
                cell.backgroundColor = UIColor(red: 0.350, green: 0.810, blue: 0.190, alpha: 1.0)
            }
            
            if question.active == true {
                cell.textLabel?.text = "Vilket årtal?!"
                cell.backgroundColor = UIColor(red: 0.930, green: 0.280, blue: 0.200, alpha: 1.0)
            }
            
            else {
                
                cell.textLabel?.text = currentTeam.asktQuestions[indexPath.row].answer
            }
            
            return cell
        } else {
            let cell = tableViewScore.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            let String1 = teams[indexPath.row].name
            let String2 = teams[indexPath.row].asktQuestions.count - 1
            let String3  = String1 + " har " + String(String2) + " Poäng"
            
            cell.textLabel!.text = String3
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 5
            cell.layer.borderColor = UIColor(red: 0.930, green: 0.280, blue: 0.200, alpha: 1.0).cgColor
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
            currentTeam.asktQuestions.insert(q, at: destinationIndexPath.row)
        }
        else{
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
            instructionLabel.text = "👉Den svarta ettiketen idikerar på vilket lag som ska spela omgången\n\n👉Den orange kanappen vissar hur många kort/poäng motståndarlagen har på sin spelplan\n\n👉Den gröna knappen svarar du på när du placerat det aktiva årtalat på den plats du tror är rätt\n\n👉Du placerar det aktiva åtalet genom att hålla på det randiga fältet och placera ditt svar mellan de rätta årtalen\n\n👉Trycker du på det aktuella frågekortet kommer frågan upp i en ny ruta med större format för lättare läsning, För att återgå till spelets ursprungsläge trycker du på frågerkortet\n\n👉spelet går ut på att svara på mellan vilka årtal som händelsen inträffat. Du placerar kortet som hänvisar till en händelse mellan dem tidigare vunna korten, det årtalet som inträffat närmst i tid placeras högst upp på tidslinjen. Blir du osäker på vart du ska placera ditt kort kan du ta hjälp av att läsa dina tidigare frågeställningar. Detta gör du genom att trycka på respektive årtal. Det lag som först uppnår 8 korrekt svarade kort har vunnit.\n\n👉Tips: Streama spelat till en större bildskärm förr en bättre spelupplevelse. spelet anpassas för alla åldrar så bjud in alla du känner för en trevlig spelkväll!😄"
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == restartGame{
            _ = segue.destination as!
            ViewController
        }
    }
    
    func displayLooks(){
        questionCardLabel.layer.borderWidth = 15
        questionCardLabel.layer.borderColor = UIColor(red: 0.930, green: 0.280, blue: 0.200, alpha: 1.0).cgColor
        questionCardLabel.layer.cornerRadius = 20
        questionCardLabel.layer.masksToBounds = true
        questionCardLabel.textContainerInset = UIEdgeInsets(top: 60, left: 20, bottom: 60, right: 20)
        
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
        bigQuestionlable.layer.cornerRadius = 10
        bigQuestionlable.layer.borderWidth = 3
        bigQuestionlable.layer.borderColor = UIColor.black.cgColor
        bigQuestionlable.textAlignment = .center
        
        tableView.backgroundColor = UIColor.systemYellow
        tableViewScore.backgroundColor = UIColor.systemYellow
        
        instructionLabel.frame.size.width = instructionLabel.intrinsicContentSize.width + 10
        instructionLabel.frame.size.height = instructionLabel.intrinsicContentSize.height + 10
        instructionLabel.textAlignment = .left
    }
}

