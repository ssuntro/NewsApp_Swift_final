//
//  MonthlyWidgetBundle.swift
//  MonthlyWidget
//
//  Created by Siroratt Suntronsuk on 2/4/2567 BE.
//

import WidgetKit
import SwiftUI

@main
struct MonthlyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MonthlyWidget()
        MonthlyWidgetLiveActivity()
    }
}
