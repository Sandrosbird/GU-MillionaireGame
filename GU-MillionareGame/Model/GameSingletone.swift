//
//  GameSingletone.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 30.10.2020.
//

import UIKit

class Game {
    
    static var shared: Game = {
        let instance = Game()
        return instance
    }()
    var result: [Results] = []

    private init() {}
}
