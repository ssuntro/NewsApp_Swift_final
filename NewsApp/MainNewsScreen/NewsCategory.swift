//
//  NewsCategory.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 9/1/2565 BE.
//

import Foundation

enum NewsCategory: String {
    case animal
    case globalWarming
    case finance
    
    var imageName: String {
        return rawValue
    }
}
