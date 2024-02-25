import SwiftUI

//how many lambda function we have here in ContentView == 3
struct ContentView: View {
    var body: some View {
        return Text("Hello, SwiftUI!")
            .onAppear {
                print("onAppear")
            }
            .onDisappear {
                print("onDisappear")
            }
        
    }
}

import PlaygroundSupport
let viewController = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = viewController



