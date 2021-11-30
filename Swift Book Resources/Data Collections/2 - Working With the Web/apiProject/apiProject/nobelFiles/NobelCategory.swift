//
//  NobelYearWinners.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import Foundation

//This struct defines a whole category recieved from the API

struct NobelCategory: Codable {
    var year: String
    var category: String
    var laureates: [NobelPrizeWinner]
    var isSelected: Bool? = false
}
