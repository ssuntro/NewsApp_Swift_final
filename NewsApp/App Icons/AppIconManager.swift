//
//  AppIconManager.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 16/1/2565 BE.
//

import Foundation
import UIKit

struct AppIconManager {
    func setIcon(from row: Int) {
        UIApplication.shared.setAlternateIconName(row % 2 == 0 ? "eye-icon": "cake-icon")
    }
}
