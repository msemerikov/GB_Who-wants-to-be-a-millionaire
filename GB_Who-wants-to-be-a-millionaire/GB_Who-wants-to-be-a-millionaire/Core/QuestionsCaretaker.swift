//
//  QuestionsCaretaker.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 01.11.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

final class QuestionsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questions"
    
    func save(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
