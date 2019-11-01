//
//  RandomQuestionsStrategy.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 01.11.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

class RandomQuestionsStrategy: OrderQuestionsStrategy {
    func chooseOrderOfQuestions(from questions: [Question]) -> [Question] {
        return questions.shuffled()
    }
}
