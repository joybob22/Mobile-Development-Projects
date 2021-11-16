import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
//
//let baseURLString = "https://api.nasa.gov/planetary/apod"
//
//let apiKey = ""
//
//let url = URL(string: baseURLString + "?api_key=\(apiKey)")!
//
//var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
//urlComponents?.queryItems = [URLQueryItem(name: "api_key", value: "")]
//
//let dataTask = URLSession.shared.dataTask(with: urlComponents!.url!) { data, response, error in
//    if let error = error {
//        print(error.localizedDescription)
//    }
//    if let data = data,
//       let string = String(data: data, encoding: .utf8) {
//        print(string)
//    }
//}
//
//dataTask.resume()


struct PhotoInfo: Codable {
//    var date: Date?
//    var mediaType: String
    var description: String
    var hdURL: URL
    var title: String
    var URL: URL
    var copyright: String?
    
    //If you want to change the key names from how they come from the API you need to implement the CodingKeys enum
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case URL = "url"
        case copyright
        case hdURL = "hdurl"
    }
}



//@escaping is needed when the function being passed in will outlive its parent function because of asynchronous calls.

func someFetchCall(completion: @escaping (Result<PhotoInfo, Error>) -> Void) {
    var urlComponents = URLComponents(string:
       "https://api.nasa.gov/planetary/apod")!
    urlComponents.queryItems = [
        "api_key": "DEMO_KEY",
        "date": "2013-07-16"
    ].map { URLQueryItem(name: $0.key, value: $0.value) }

    let task = URLSession.shared.dataTask(with: urlComponents.url!)
       { (data, response, error) in
           
       let jsonDecoder = JSONDecoder()

           if let data = data{
               do {
                   
                   let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
                   completion(.success(photoInfo))
               } catch {
                   completion(.failure(error))
               }
        }
        PlaygroundPage.current.finishExecution()
    }
    task.resume()
}

someFetchCall { result in
    switch result {
    case .success(let photoInfo):
        print(photoInfo)
    case .failure(let error):
        print("There was an error: \(error.localizedDescription)")
    }
}
    
    


