//
//  CustomTabBar.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 1/4/2567 BE.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var tabSelection: Int
    @Namespace private var animationNamespace
    
    let items: [(image: String, title: String)] = [
    ("house", "Home"),
    ("magnifyingglass", "Search"),
    ("heart", "Favorites"),
    ("person", "Profile"),
    ("gear", "Settings")]
    
    var body: some View {
        ZStack {
            Capsule()
                .frame(height: 80)
                .foregroundStyle(.brown)
//                .foregroundStyle(
//                    
//                    LinearGradient(
//                        colors: [.teal, .secondary],
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                )
                .shadow(radius: 2)
            HStack {
                ForEach(0..<5) { index in
                    Button {
                        tabSelection = index + 1
                    } label: {
                        VStack(spacing: 8, content: {
                            Spacer()
                            Image(systemName: items[index].image)
                            Text(items[index].title)
                                .font(.caption)
                            if index + 1 == tabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(.blue)
//                                    .matchedGeometryEffect(id: "SelectedTabId", in: animationNamespace)
                            } else {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(.clear)
                                    .offset(y: 3)
                                
                            }
                        }).foregroundStyle(index + 1 == tabSelection ? .blue: .white)
                    }
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
    }
}

struct CustomTabBarUser: View {
    @State private var tabSelection = 1
    var body: some View {
        PlaylistTableView()
        TabView(selection: $tabSelection,
                content:  {
//            Text("Tab Content 1").tag(1)
//            Text("Tab Content 2").tag(2)
//            Text("Tab Content 3").tag(3)
//            Text("Tab Content 4").tag(4)
//            Text("Tab Content 5").tag(5)
        })
        .overlay(alignment: .bottom) {
            CustomTabBar(tabSelection: $tabSelection)
        }
        .frame(height: 80)
//        TabView {
//            ReceivedView()
//                .badge(2)
//                .tabItem {
//                    Label("Received", systemImage: "tray.and.arrow.down.fill")
//                }
//            SentView()
//                .tabItem {
//                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
//                }
//            AccountView()
//                .badge("!")
//                .tabItem {
//                    Label("Account", systemImage: "person.crop.circle.fill")
//                }
//        }
    }
}

#Preview {
    CustomTabBarUser()
}
