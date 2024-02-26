import SwiftUI

//            didLoad, didAppear, didDisappear, deinit - https://stevenpcurtis.medium.com/the-uiviewcontroller-lifecycle-b964cf18256b
//https://www.hackingwithswift.com/quick-start/swiftui/how-to-respond-to-view-lifecycle-events-onappear-and-ondisappear
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Text("Hello World")
                }
            }
            .onAppear {
                print("ContentView appeared!")
            }
            .onDisappear {
                print("ContentView disappeared!")
            }
        }
    }
}


class DetailViewModel: ObservableObject {
    deinit { //ava only class
        print("DetailView is deinited")
    }
    init() {
        print("DetailView is inited")
    }
}


struct DetailView: View {
    @StateObject private var vm = DetailViewModel()
    var body: some View {
        VStack {
            Text("Second View")
        }
        .onAppear {
            print("DetailView appeared!")
        }
        .onDisappear {
            print("DetailView disappeared!")
        }
    }
    

}

import PlaygroundSupport
let viewController = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = viewController
