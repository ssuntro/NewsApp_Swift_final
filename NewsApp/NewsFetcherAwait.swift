//
//  NewsFetcherAwait.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 15/1/2565 BE.
//

import Foundation
//    [tmr can complete this]
//    -> Fetch data from API.Await
//    -> Pull to refresh
//    -> Festive App Icon(reorder needed)
//    -> [SwiftUI] Layout Login screen
//    -> #9 Its functionality
//    -> select profile image from camera and Gallery -> pause
    
//    there is urgent requiment for new app which is ChatApp
//    [Sunday] ChatApp + FirebaseAuth + other in app data then mock

struct NewsFetcherAwait {
//    var task: Task<[News], Error>?
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
//    mutating func exe() async -> Result<[News], Error>? {
//        task?.cancel()
//        task = template
//        let result = await task?.result
//        print("exe complete")
//        return result
//    }
}
