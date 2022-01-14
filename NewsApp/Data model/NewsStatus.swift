//
//  NewsStatus.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 9/1/2565 BE.
//

import Foundation
import UIKit

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
