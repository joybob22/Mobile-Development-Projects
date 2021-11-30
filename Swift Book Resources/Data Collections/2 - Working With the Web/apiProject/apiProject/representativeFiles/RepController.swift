//
//  RepController.swift
//  apiProject
//
//  Created by Brayden Lemke on 11/16/21.
//

import Foundation

class RepController {
    var beginURL = "https://whoismyrepresentative.com/getall_mems.php?zip="
    var endURL = "&output=json"
    
    func fetchData(zipCode: String, completion: @escaping(Result<[RepInfo], Error>) -> Void) {
        let url = URL(string: beginURL + zipCode + endURL)!
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let dataTask = URLSession.shared.dataTask(with: (urlComponents?.url)!) { data, response, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let myResponse = try decoder.decode(RepResult.self, from: data)
                    completion(.success(myResponse.results))
                } catch {
                    print("Failed while decoding rep JSON")
                }
            }
        }
        dataTask.resume()
    }
}
