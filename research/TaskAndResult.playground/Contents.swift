import Foundation
import UIKit

//MARK: Model
struct News {
    let detail: NewsDetail
    let category: NewsCategory
}
enum NewsCategory: Int, Codable {
    case animal = 0
    case globalWarming = 1
    case finance = 2
    
    var imageName: String {
        switch self {
        case .animal:
            return "animal"
        case .globalWarming:
            return "globalWarming"
        case .finance:
            return "finance"
        }
    }
}

struct NewsDetail: Codable {
    let title: String
    let body: String
    let url: URL
    let status: NewsStatus
}

enum NewsStatus: String, Codable {
    case closed
    case responded
    case pendingResponse = "pending response"
    
    var color: UIColor {
        switch self {
        case .responded:
            return UIColor.systemTeal
        case .pendingResponse:
            return UIColor.systemRed
        case .closed:
            return UIColor.systemGreen
        }
    }
}
enum APIError: Error {
    case NotTwoHundred
    case FailedSerialisation
}

//MAKR: Spike Result.
//In summary, task need to use with Result type. while Result type is not depends on Task
struct NewsFetcherAwait {
    let task: Task<[News], Error> =  {
        return Task { () -> [News] in
//            throw APIError.NotTwoHundred
            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("error explicit casting")
                throw APIError.NotTwoHundred
            }
            
            guard let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let rawNews = dict["results"] as? [[String: Any]] else {
                throw APIError.FailedSerialisation
            }
//            v.1
//            return [
//                rawNews[0...3],
//                rawNews[4...6],
//                rawNews[7...15]]
//                .enumerated()
//                .map { (index, list) in
//                    list.compactMap { elem -> News? in
//                        if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
//                           let detail = try? JSONDecoder().decode(NewsDetail.self, from: data) {
//                            return News(detail: detail, category: .animal)
//                        }
//                        return nil
//                    }
//                }.reduce([News]()) { partialResult, elem in
//                    partialResult + elem
//                }
            
            
            
//            v.2
            return [
                rawNews[0...3],
                rawNews[4...6],
                rawNews[7...15]]
                .enumerated()
                .map { (index, list) in
                    list.compactMap { elem -> News? in
                        if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
                           let detail = try? JSONDecoder().decode(NewsDetail.self, from: data),
                           let category = NewsCategory(rawValue: index) {
                            return News(detail: detail, category: category)
                        }
                        return nil
                    }
                }.reduce([News]()) { partialResult, elem in
                    partialResult + elem
                }
            
        }
    }()
}
Task {
    let result = await NewsFetcherAwait().task.result //need to simplify await
    switch(result) {
    case .success(let data):
        print("fetchData completed.")
        print(data)
    case .failure(let error):
        print("error")
        print(error)
    }

}

