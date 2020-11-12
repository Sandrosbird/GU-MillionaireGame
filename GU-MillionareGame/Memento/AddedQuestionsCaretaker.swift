//
//  AddedQuestionsCaretaker.swift
//  GU-MillionareGame
//
//  Created by Emil Mescheryakov on 09.11.2020.
//

import Foundation

final class AddedQuestionsCaretaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let userDefaults = UserDefaults.standard
    
    private let key = "questions"
    
    func save (records: [Question]) {
        do {
            let data = try self.encoder.encode(records)
            userDefaults.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Question] {
        guard let data = userDefaults.data(forKey: key) else { return [] }
        
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    
    func deleteAll(records: [Question]) {
        userDefaults.removeObject(forKey: key)
    }
}
