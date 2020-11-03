//
//  GameSingletone.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 30.10.2020.
//

import UIKit

class Game {
    
    static let shared = Game()
    private (set) var results: [GameSession] {
        didSet {
            gameSessionCaretaker.save(records: self.results)
        }
    }
    var gameSession: GameSession?
    private let gameSessionCaretaker = GameSessionCaretaker()

    private init() {
        self.results = gameSessionCaretaker.retrieveRecords()
    }
    
    func addToResults(results: GameSession){
        self.results.append(results)
    }
    
    func getResults() -> [GameSession] {
        return results
    }
}
