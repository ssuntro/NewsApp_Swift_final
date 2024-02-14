//
//  NewsCategory.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 9/1/2565 BE.
//

import Foundation

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
