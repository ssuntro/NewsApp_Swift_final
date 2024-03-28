//
//  SimpleSwiftUIProjectApp.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 17/3/2567 BE.
//

import SwiftUI
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(">> your code here !!")
        return true
    }
}


@main
struct SimpleSwiftUIProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var phase
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LongBlock_mainThread()
//            SimpleDelegatePatternView()
        }
        .onChange(of: phase) { oldValue, newPhase in
            switch newPhase {
            case .active:
                print("App became active")
            case .inactive:
                print("App became inactive")
            case .background:
                print("App is running in the background")
            @unknown default:
                print("Fallback for future cases")
            }
        }
        
    }
}

