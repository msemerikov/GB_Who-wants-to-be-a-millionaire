//
//  GameSession.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

class GameSession {
    var totalQuestions: Int = 0
    var currentQuestion: Int = 0
    var correctAnswers: Int = 0
    var percentCorrectAnswers: Int = 0
    var isFiftyFifty: Bool = true
    var isPhoneAFriend: Bool = true
    var isAskTheAudience: Bool = true
    
    private func calculatePercentCorrectAnswers() {
        guard totalQuestions != 0 else { return }
        percentCorrectAnswers = Int(Double(correctAnswers) / Double(totalQuestions) * 100)
    }
}

extension GameSession: GameViewControllerDelegate {
    func correctAnswer() {
        correctAnswers += 1
        currentQuestion += 1
        calculatePercentCorrectAnswers()
    }
    
    func endGame() {
        Game.shared.gameDidEnd(with: percentCorrectAnswers)
    }

}
