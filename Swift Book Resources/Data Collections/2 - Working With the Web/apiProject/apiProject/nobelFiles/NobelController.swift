//
//  NobelController.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/29/21.
//

import Foundation

class NobelController {
    var url = "https://api.nobelprize.org/v1/prize.json?year="
    
    func fetchData(year: String, completion: @escaping(Result<[NobelCategory], Error>) -> Void) {
        let completeURL = URL(string: url + year)!
        let urlComponents = URLComponents(url: completeURL, resolvingAgainstBaseURL: true)
        
        let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, response, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let myResponse = try decoder.decode(NobelData.self, from: data)
                    completion(.success(myResponse.prizes))
                } catch {
                    print("Failed while decoding nobel JSON")
                }
            }
        }
        
        dataTask.resume()
    }
}
