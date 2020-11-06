//
//  RandomQuestionsStrategy.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 04.11.2020.
//

import UIKit

final class RandomQuestionsOrder: QuestionsStrategyProtocol {
    func setQuestions() -> Order {
        return .random
    }
}
