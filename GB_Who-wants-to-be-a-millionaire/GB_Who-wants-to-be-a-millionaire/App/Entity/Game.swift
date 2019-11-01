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
    var orderQuestions: OrderQuestions
    
    private let resultCaretaker = ResultCaretaker()
    private let questionsCaretaker = QuestionsCaretaker()
    private(set) var gameResults: [GameResult] {
        didSet {
            resultCaretaker.save(gameResults: self.gameResults)
        }
    }
    
    private(set) var questions: [Question] {
        didSet {
            questionsCaretaker.save(questions: self.questions)
        }
    }
    
    private init() {
        self.gameResults = self.resultCaretaker.retrieveResults()
        self.questions = self.questionsCaretaker.retrieveResults()
        self.orderQuestions = .sequentially
    }
    
    func gameDidEnd(with percentCorrectAnswers: Int) {
        let date = Date()
        let newRecord = GameResult(date: date, percentCorrectAnswers: percentCorrectAnswers)
        gameResults.append(newRecord)
        gameSession = nil
    }
    
    func addQuestion(question: Question) {
        questions.append(question)
    }
    
    func clearResults() {
        gameResults = []
    }
}
