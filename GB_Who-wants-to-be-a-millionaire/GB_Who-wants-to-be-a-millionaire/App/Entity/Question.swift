//
//  Question.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import Foundation

struct Question: Codable {
    let question: String
    let answers: [String]
    let rightAnswer: Int
}
