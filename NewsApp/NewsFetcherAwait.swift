//
//  NewsFetcherAwait.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 15/1/2565 BE.
//

import Foundation

struct NewsFetcherAwait {
    var news: [News] {
        get async {
            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
            guard let (data, response) =  try? await URLSession.shared.data(from: url) else {
                return [News]()
            }
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let rawNews = dict["results"] as? [[String: Any]] else {
                          return [News]()
                  }
            print("NewsFetcherAwait thread: \(Thread.current)")
            print("NewsFetcherAwait is main thread: \(Thread.isMainThread)")
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
    }
    
//    func fetchData1() async -> [News]  {
//            
//            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
//            guard let (data, response) =  try? await URLSession.shared.data(from: url) else {
//                return [News]()
//            }
//            guard let response = response as? HTTPURLResponse,
//                  response.statusCode == 200,
//                  let dict = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                  let rawNews = dict["results"] as? [[String: Any]] else {
//                          return [News]()
//                  }
//            return [
//                rawNews[0...3],
//                rawNews[4...6],
//                rawNews[7...15]]
//                .enumerated()
//                .map { (index, list) in
//                    list.compactMap { elem -> News? in
//                        if let data = try? JSONSerialization.data(withJSONObject: elem, options: []),
//                           let detail = try? JSONDecoder().decode(NewsDetail.self, from: data),
//                           let category = NewsCategory(rawValue: index) {
//                            return News(detail: detail, category: category)
//                        }
//                        return nil
//                    }
//                }.reduce([News]()) { partialResult, elem in
//                    partialResult + elem
//                }
//        }
}

