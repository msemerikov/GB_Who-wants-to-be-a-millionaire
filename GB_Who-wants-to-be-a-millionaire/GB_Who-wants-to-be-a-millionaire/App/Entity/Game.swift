//
//  Game.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

final class Game {
    static let shared = Game()
    var gameSession: GameSession?
    private let resultCaretaker = ResultCaretaker()
    private(set) var gameResults: [GameResult] {
        didSet {
            resultCaretaker.save(gameResults: self.gameResults)
        }
    }
    
    private init() {
        self.gameResults = self.resultCaretaker.retrieveResults()
    }
    
    func gameDidEnd(with percentCorrectAnswers: Int) {
        let date = Date()
        let newRecord = GameResult(date: date, percentCorrectAnswers: percentCorrectAnswers)
        gameResults.append(newRecord)
        gameSession = nil
    }
    
    func clearResults() {
        gameResults = []
    }
}
