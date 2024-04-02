//
//  TableView_swiftUI.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 2/4/2567 BE.
//

import SwiftUI

struct AView: View {
    var body: some View {
        
        Color.purple
            .ignoresSafeArea(.all) // Ignore just for the color
                .overlay(
                    VStack(spacing: 20) {
                        Text("Overlay").font(.largeTitle)
                        Text("Example").font(.title).foregroundColor(.white)
                        if #available(iOS 16.0, *) {
                            List {
                                DetailView()
                                DetailView()
                                DetailView()
                            }
                            .scrollContentBackground(.hidden)
    //                            .background(.gray)
                        } else {
                            // Fallback on earlier versions
                        }
                }
                )
        
    }
}
struct DetailView: View {
    var body: some View {
        
        
        
        Text("ssss").listRowBackground(Color.green)
        
//        HStack {
//            RoundedRectangle(cornerRadius: 8)
//                .fill(Color.gray)
//            .frame(height: 115)
//            Text("HElloww jaa")
//        }
//        .foregroundStyle(Color.blue)
//        .background(Color.purple)
        
//        TabView {
//            VStack {
//                Text("Hello, World!")
//                Divider()
//                Spacer()
//                // Bleeds into TabView
//                Rectangle()
//                    .frame(height: 0)
//                    .background(.thinMaterial)
//            }
//            .background(Color.purple)
//            .tabItem {
//                Text("Tab 1")
//                Image(systemName: "wifi")
//            }
//        }
        
        
        
    }
}

#Preview {
    AView()
}
