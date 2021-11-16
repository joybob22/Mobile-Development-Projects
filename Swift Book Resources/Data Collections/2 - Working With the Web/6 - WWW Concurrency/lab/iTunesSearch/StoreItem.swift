//
//  StoreItem.swift
//  iTunesSearch
//
//  Created by Brayden Lemke on 11/15/21.
//

import Foundation

//struct StoreItem: Codable {
//    var artist: String
//    var song: String
//    var genre: String
//    var artworkURL: URL
//    
//    enum CodingKeys: String, CodingKey {
//        case artist = "artistName"
//        case song = "trackName"
//        case genre = "primaryGenreName"
//        case artworkURL = "artworkUrl100"
//    }
//}
//
//struct SearchResponse: Codable {
//    let results: [StoreItem]
//}


struct StoreItem: Codable {
    let name: String
    let artist: String
    var kind: String
    var description: String?
    var artworkURL: URL
    
    enum CodingKeys: String, CodingKey {
        case name = "trackName"
        case artist = "artistName"
        case kind
        case description = "longDescription"
        case artworkURL = "artworkUrl100"
    }
    
    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: CodingKeys.name)
        artist = try values.decode(String.self, forKey: CodingKeys.artist)
        kind = try values.decode(String.self, forKey: CodingKeys.kind)
        artworkURL = try values.decode(URL.self, forKey: CodingKeys.artworkURL)

        if let description = try? values.decode(String.self, forKey: CodingKeys.description) {
            self.description = description
        } else {
            let additionalValues = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additionalValues.decode(String.self, forKey: AdditionalKeys.longDescription)) ?? ""
        }
    }
}
