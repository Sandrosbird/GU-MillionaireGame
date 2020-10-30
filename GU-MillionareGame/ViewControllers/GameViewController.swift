//
//  GameViewController.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 29.10.2020.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var questionTitle: UILabel!
    
    @IBOutlet weak var questionText: UILabel!
    
    @IBOutlet weak var firstAnswer: UIButton!
    @IBAction func firstAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: firstAnswer, question: questionsArray[questionsCount])
    }
    
    @IBOutlet weak var secondAnswer: UIButton!
    @IBAction func secondAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: secondAnswer, question: questionsArray[questionsCount])
    }
    
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBAction func thirdAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: thirdAnswer, question: questionsArray[questionsCount])
    }
    
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBAction func fourthAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: fourthAnswer, question: questionsArray[questionsCount])
        
    }
    
    //MARK: - Variables
    let game = Game.shared
    let questionsArray = QuestionsFactory.createQuestions()
    var questionsCount = 0
    
    var score = 0
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAnswers(question: questionsArray[questionsCount])
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Helpers
    func configureAnswers(question: Question) {
        let count = questionsCount + 1
        questionTitle.text = "Question \(count)"
        questionText.text = question.question
        firstAnswer.setTitle(question.answers[0], for: .normal)
        secondAnswer.setTitle(question.answers[1], for: .normal)
        thirdAnswer.setTitle(question.answers[2], for: .normal)
        fourthAnswer.setTitle(question.answers[3], for: .normal) 
    }
    
    func gameEnded() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destination = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController else { return }
        let result = Results(score: score, questionsPassed: questionsCount+1)
        game.addToResults(results: result)
        dismiss(animated: true) {
            self.show(destination, sender: nil)
        }
    }
    
    func checkAnswer(answer: UIButton, question: Question) {
        if answer.titleLabel?.text == question.correctAnswer {
            score += 10
            questionsCount += 1
            configureAnswers(question: questionsArray[questionsCount])
        } else {
            gameEnded()
        }
    }
}
