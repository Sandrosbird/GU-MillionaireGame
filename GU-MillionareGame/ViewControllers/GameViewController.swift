//
//  GameViewController.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 29.10.2020.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(withResult result: GameSession)
}

class GameViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    
    //MARK: - Variables
    let session = GameSession()
    weak var gameViewControllerDelegate: GameViewControllerDelegate?
    
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
    
    //MARK: - Actions
    @IBAction func firstAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: answerButtons[0], question: questionsArray[questionsCount])
    }
    @IBAction func secondAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: answerButtons[1], question: questionsArray[questionsCount])
    }
    @IBAction func thirdAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: answerButtons[2], question: questionsArray[questionsCount])
    }
    @IBAction func fourthAnswerTapped(_ sender: UIButton) {
        checkAnswer(answer: answerButtons[3], question: questionsArray[questionsCount])
    }
    
    
    //MARK: - Helpers
    func configureAnswers(question: Question) {
        let count = questionsCount + 1
        questionTitle.text = "Question \(count)"
        questionText.text = question.question
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(question.answers[index], for: .normal)
        }
        
//        firstAnswer.setTitle(question.answers[0], for: .normal)
//        secondAnswer.setTitle(question.answers[1], for: .normal)
//        thirdAnswer.setTitle(question.answers[2], for: .normal)
//        fourthAnswer.setTitle(question.answers[3], for: .normal)
    }
    
    func gameEnded() {
        session.questionsCount = questionsArray.count
        session.questionsPassed = questionsCount
        session.score = score
    
        gameViewControllerDelegate?.didEndGame(withResult: session)
//        dismiss(animated: true) {
//            self.show(destination, sender: nil)
//        }
    }
    
    func checkAnswer(answer: UIButton, question: Question) {
        if answer.titleLabel?.text == question.correctAnswer {
            score += 10
            questionsCount += 1
            
            if questionsCount >= questionsArray.count {
                gameEnded()
                return
            }
            configureAnswers(question: questionsArray[questionsCount])
        } else {
            gameEnded()
        }
    }
}
