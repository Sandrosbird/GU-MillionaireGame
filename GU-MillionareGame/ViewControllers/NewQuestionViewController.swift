//
//  NewQuestionViewController.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 09.11.2020.
//

import UIKit

class NewQuestionViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var newQuestionTextView: UITextView!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    
    //MARK: - Properties
//    var question: Question?
    var questions: [Question] = []
    
    
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Helpers
    
    private func createNewQuestion() -> Question? {
        guard let questionText = newQuestionTextView.text,
              let firstAnswerTextField = firstAnswerTextField.text,
              let secondAnswerTextField = secondAnswerTextField.text,
              let thirdAnswerTextField = thirdAnswerTextField.text,
              let correctAnswerTextField = correctAnswerTextField.text
        else { return nil }
        
        
        let answers: [String] = [firstAnswerTextField, secondAnswerTextField, thirdAnswerTextField, correctAnswerTextField]
        
        return Question(question: questionText, answers: answers, correctAnswer: correctAnswerTextField)
    }
    
    //MARK: - Actions
    @IBAction func addQuestionButtonDidTap(_ sender: UIButton) {
        
        let question = createNewQuestion()!
        questions.append(question)
        AddedQuestionsCaretaker().save(records: questions)
        self.dismiss(animated: true, completion: nil)
    }
}
