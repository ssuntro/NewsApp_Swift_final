//
//  Combine_SwiftUI.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 2/4/2567 BE.
//

import SwiftUI
import Combine

struct Animation1View: View {
    @State private var isAnimating = true {
        didSet {
            print("isAnimating: \(isAnimating)")
        }
    }

    var body: some View {
        VStack {
            Text("dddd")
        }
        .onAppEnteredBackground {
            isAnimating = false
        }
        .onAppWillEnterForeground {
            isAnimating = true
        }
    }
}

extension View {
    func onNotification(
        _ notificationName: Notification.Name,
        perform action: @escaping () -> Void
    ) -> some View {
        onReceive(NotificationCenter.default.publisher(
            for: notificationName
        )) { _ in
            action()
        }
    }

    func onAppEnteredBackground(
        perform action: @escaping () -> Void
    ) -> some View {
        onNotification(
            UIApplication.didEnterBackgroundNotification,
            perform: action
        )
    }
    func onAppWillEnterForeground(
        perform action: @escaping () -> Void
    ) -> some View {
        onNotification(
            UIApplication.willEnterForegroundNotification,
            perform: action
        )
    }
}

#Preview {
    Animation1View()
}



