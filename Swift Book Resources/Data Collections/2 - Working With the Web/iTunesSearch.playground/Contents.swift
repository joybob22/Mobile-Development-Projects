import UIKit
import PlaygroundSupport
import Foundation

PlaygroundPage.current.needsIndefiniteExecution = true

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
               JSONSerialization.jsonObject(with: self,
               options: []),
            let jsonData = try?
               JSONSerialization.data(withJSONObject:
               jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData,
               encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}

struct StoreItem: Codable {
    var artist: String
    var song: String
    var genre: String
    
    enum CodingKeys: String, CodingKey {
        case artist = "artistName"
        case song = "trackName"
        case genre = "primaryGenreName"
    }
}

struct SearchResponse: Codable {
    let results: [StoreItem]
}

func fetchItems(matching query: [String: String], completion: @escaping (Result<[StoreItem], Error>) -> Void) {
    let baseURL = URL(string: "https://itunes.apple.com/search")!

    var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

    //Creates a readable array of the parameters I want to add.
    //It then maps over the readable items and makes them into the correct URLQueryItem type
    urlComponents?.queryItems = [
        "term": "Juice Wrld",
        "country": "us",
        "media": "music"
    ].map({ key, value in
        URLQueryItem(name: key, value: value)
    })

    let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, responseDisposition, error in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if let data = data {
            data.prettyPrintedJSONString()
        }
        
    //    if let data = data,
    //        let string = String(data: data, encoding: .utf8) {
    //            print(string)
    //    }
        
        PlaygroundPage.current.finishExecution()
        

    }

    dataTask.resume()
}





