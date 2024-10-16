//
//  News.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 9/1/2565 BE.
//

import Foundation
struct News: Identifiable {

    let id = UUID()
    let detail: NewsDetail
    let category: NewsCategory
}

struct NewsDetail: Codable {
    let title: String
    let body: String
    let url: URL
    let status: NewsStatus
}
