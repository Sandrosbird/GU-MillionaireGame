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
    var order: Order?
    
    let primalArray: [Question] = QuestionsFactory.createQuestions()
    var questionsArray: [Question] = []
    var questionsCount = 0
    
    var score = 0
    
    //MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        questionsArray = {
            configureOrder(in: primalArray, with: self.order ?? .direct)
        }()
        configureAnswers(question: questionsArray[questionsCount])
        questionsCount = 0
    }
    
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
        
        questionTitle.text = "Question \(count)/\(questionsArray.count)"
        questionText.text = question.question
        
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(question.answers[index], for: .normal)
        }
    }
    
    func gameEnded() {
        session.questionsCount = questionsArray.count
        session.questionsPassed = questionsCount
        session.score = score
    
        gameViewControllerDelegate?.didEndGame(withResult: session)
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
    
    func configureOrder(in array: [Question], with order: Order) -> [Question] {
        var mutableArray = array
        switch order {
        case .direct:
            let orderedArray = mutableArray
            return orderedArray
        case .random:
            var orderedArray = [Question]()
            var count = mutableArray.count
            while !mutableArray.isEmpty {
                if count > 0 {
                    orderedArray.append(mutableArray.remove(at: Int(arc4random_uniform(UInt32(count)))))
                    count -= 1
                }
            }
            return orderedArray
        }
    }
}
