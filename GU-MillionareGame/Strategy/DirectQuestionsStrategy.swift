//
//  QuestionsStrategy.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 04.11.2020.
//

import UIKit

protocol QuestionsStrategyProtocol {
    func setQuestions() -> Order
}

final class DirectQuestionsOrder: QuestionsStrategyProtocol {
    func setQuestions() -> Order {
        return .direct
    }
}
