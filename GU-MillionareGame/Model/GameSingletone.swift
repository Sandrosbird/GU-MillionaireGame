//
//  GameSingletone.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 30.10.2020.
//

import UIKit

class Game {
    
    static let shared = Game()
    private var results: [Results] = []
    var gameSession: GameSession?

    private init() {}
    
    func addToResults(results: Results) {
        self.results.append(results)
    }
    
    func getResults() -> [Results] {
        return results
    }
}
