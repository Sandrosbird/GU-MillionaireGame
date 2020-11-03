//
//  GameSessionCaretaker.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 03.11.2020.
//

import UIKit

final class GameSessionCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let userDefaults = UserDefaults.standard
    
    private let key = "results"
    
    func save (records: [GameSession]) {
        do {
            let data = try self.encoder.encode(records)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [GameSession] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        
        do {
            return try self.decoder.decode([GameSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
