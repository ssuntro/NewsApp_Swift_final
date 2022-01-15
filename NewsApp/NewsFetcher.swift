//
//  NewsFetcher.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 14/1/2565 BE.
//

import Foundation

let mockAPIResponse = [News(detail: NewsDetail(title: "news1", body: "body1111", url: URL(string: "https://google.com")!, status: .closed),
                            category: .animal)]
//                   News(title: "news2", body: "body2222", url: URL(string: "https://google.com")!, status: .responded, category: .globalWarming),
//                   News(title: "news3", body: "body3", url: URL(string: "https://google.com")!, status: .pendingResponse, category: .globalWarming),
//                   News(title: "news4", body: "body444", url: URL(string: "https://www.google.com/search?q=dog&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjV3vG4_qT1AhWaTGwGHVdODRkQ_AUoAXoECAIQAw&biw=1920&bih=919&dpr=1#imgrc=btQ8-aZ4x2YyMM")!, status: .closed, category: .finance)]

 
struct NewsFetcher {
    var task: URLSessionDataTask? //why we need task?


    mutating func exe(completion: @escaping ([News]) -> Void) { //Why cannot be func exe() -> [News] {}?
        task?.cancel()
        let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let data = data,
                  let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let xx = dict["results"] as? [[String: Any]] else {
//                      return [News]()
                      DispatchQueue.main.async {
                          completion([News]())
                      }
                      return
                  }
            
            let animals = xx[0...3].compactMap { elem -> News? in
                if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
                   let rr = try? JSONDecoder().decode(NewsDetail.self, from: data) {
                    return News(detail: rr, category: .animal)
                }
                return nil
            }
            
            let finance = xx[4...6].compactMap { elem -> News? in
                if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
                   let rr = try? JSONDecoder().decode(NewsDetail.self, from: data) {
                    return News(detail: rr, category: .finance)
                }
                return nil
            }
            
            let globalWarming = xx[7...15].compactMap { elem -> News? in
                if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
                   let rr = try? JSONDecoder().decode(NewsDetail.self, from: data) {
                    return News(detail: rr, category: .globalWarming)
                }
                return nil
            }
            
            DispatchQueue.main.async {
                completion(animals + finance + globalWarming)
            }
        }
        task?.resume()
    }
}

