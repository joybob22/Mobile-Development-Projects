//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Brayden Lemke on 11/15/21.
//

import Foundation
import UIKit

struct Results: Codable {
    var results: [StoreItem]
}

class StoreItemController {
    
    func fetchItems(matching query: [String: String], completion: @escaping (Result<[StoreItem], Error>) -> Void) {
        let baseURL = URL(string: "https://itunes.apple.com/search")!

        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

        //Creates a readable array of the parameters I want to add.
        //It then maps over the readable items and makes them into the correct URLQueryItem type
        urlComponents?.queryItems = query.map({ key, value in
                        URLQueryItem(name: key, value: value)
                    })
        
//        [
//            "term": "Juice Wrld",
//            "country": "us",
//            "media": "music"
//        ].map({ key, value in
//            URLQueryItem(name: key, value: value)
//        })

        let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, responseDisposition, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            }
            
            if let data = data {
//                let prettyData = data.prettyPrintedJSONString()
                let decoder = JSONDecoder()
                do {
                    let stuff = try decoder.decode(Results.self, from: data)
                    
                    
                    completion(.success(stuff.results))
                    
                } catch {
                    print(error)
                }
                
                
                
            }
            
        //    if let data = data,
        //        let string = String(data: data, encoding: .utf8) {
        //            print(string)
        //    }
            

        }

        dataTask.resume()
    }
    
    func fetchImage(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        urlComponents?.scheme = "https"
        
        let task = URLSession.shared.dataTask(with: urlComponents!.url!) { data, response, err in
            if let data = data,
               let image = UIImage(data: data){
                completion(.success(image))
            } else if let err = err {
                completion(.failure(err))
            }
        }
        task.resume()
    }
    
}

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
