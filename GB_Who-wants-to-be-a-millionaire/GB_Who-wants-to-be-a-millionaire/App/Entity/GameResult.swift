//
//  GameResult.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct GameResult: Codable {
    let date: Date
    let percentCorrectAnswers: Int
}
