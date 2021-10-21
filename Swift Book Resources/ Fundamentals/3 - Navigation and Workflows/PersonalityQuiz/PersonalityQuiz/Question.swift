//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Brayden Lemke on 10/7/21.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}
