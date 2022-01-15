//
//  NewsFetcherAwait.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 15/1/2565 BE.
//

import Foundation

struct NewsFetcherAwait {
    let task: Task<[News], Error> =  {
        return Task { () -> [News] in
            let url = URL(string: "https://www.hackingwithswift.com/samples/petitions-2.json")!
            let (_, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("error explicit casting")
                return [News]()
            }
            return mockAPIResponse
        }
    }()
}
