//
//  Question.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 28.10.2020.
//

import UIKit

struct Question {
    var question: String
    var answers: [String]
    var correctAnswer: String
}

final class QuestionsFactory {
    static func createQuestions() -> [Question] {
        let question1 = Question(question: "Кто первым доказал периодичность появления комет", answers: ["Галилей", "Коперник", "Кеплер", "Галлей"], correctAnswer: "Галлей")
        let question2 = Question(question: "С какой из этих стран не имеет границ Чехия?", answers: ["Венгрия", "Германия", "Австрия", "Польша"], correctAnswer: "Венгрия")
        let question3 = Question(question: "Кто считается основоположником кубизма?", answers: ["Кандинский", "Пикассо", "Леже", "Малевич"], correctAnswer: "Пикассо")
        let question4 = Question(question: "В каком городе в 1932 году был проведен первый кинофестиваль?", answers: ["Канн","Париж","Венеция","Берлин"], correctAnswer: "Венеция")
        let question5 = Question(question: "Какая российская автономия полностью окружена Краснодарским краем?", answers: ["Адыгея", "Хакасия", "Ингушетия", "Удмуртия"], correctAnswer: "Адыгея")
        
        return [question1, question2, question3, question4, question5]
    }
}
