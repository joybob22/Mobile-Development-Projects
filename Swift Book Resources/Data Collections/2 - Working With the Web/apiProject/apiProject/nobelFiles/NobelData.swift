//
//  NobelData.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import Foundation

//The struct that defines the first object given back from the API

struct NobelData: Codable {
    var prizes: [NobelCategory]
}
