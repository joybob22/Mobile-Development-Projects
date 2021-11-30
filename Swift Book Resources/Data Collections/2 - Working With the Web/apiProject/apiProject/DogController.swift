//
//  DogController.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/16/21.
//

import Foundation
import UIKit

struct DogImageResponse: Codable {
    var message: String
}

class DogController {
    
    private let url = URL(string: "https://dog.ceo/api/breeds/image/random")
    
    func fetchData(completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlComponents = URLComponents(url: url!, resolvingAgainstBaseURL: true)
        let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, response, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let myResponse = try decoder.decode(DogImageResponse.self, from: data)
                    print(myResponse)
                    self.fetchImage(url: URL(string: myResponse.message)!, completion: completion)
                } catch {
                    
                }
            }
        }
        dataTask.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, response, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            if let data = data, let image = UIImage(data: data) {
                completion(.success(image))
            }
        }
        dataTask.resume()
    }
}
