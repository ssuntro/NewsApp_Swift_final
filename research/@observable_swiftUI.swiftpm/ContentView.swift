//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI
import Observation

class UserSettingsBeforeObservableMacro: ObservableObject {
    @Published var followers: Int = 0
}

struct ProfileViewBeforeObservableMacro: View {
    @ObservedObject var userSettings =  UserSettingsBeforeObservableMacro()
    @StateObject var userSettings2 =  UserSettingsBeforeObservableMacro()
    @State var userSettings3 =  UserSettingsBeforeObservableMacro()
    
    var body: some View {
        VStack {
            VStack(content: {
                Text("Followers: \(userSettings.followers)")
                Button("Increment Followers") {
                    self.userSettings.followers += 1
                }
            })
            VStack(content: {
                Text("Followers: \(userSettings2.followers)")
                Button("Increment Followers") {
                    self.userSettings2.followers += 1
                }
            })
            VStack(content: {
                Text("Followers: \(userSettings3.followers)")
                Button("Increment Followers") {
                    self.userSettings3.followers += 1
                }
            })
        }
        
    }
}


@available(iOS 17.0, *)
@Observable 
class UserSettingsAfterObservableMacro {
    var followers: Int = 0
}

@available(iOS 17.0, *)
struct ProfileViewAfterObservableMacro: View {
    var userSettings = UserSettingsAfterObservableMacro()
    var userSettings2 =  UserSettingsAfterObservableMacro()
    @State private var userSettings3 =  UserSettingsAfterObservableMacro()
    
    var body: some View {
        VStack {
            VStack(content: {
                Text("Followers: \(userSettings.followers)")
                Button("Increment Followers") {
                    self.userSettings.followers += 1
                }
            })
            VStack(content: {
                Text("Followers: \(userSettings2.followers)")
                Button("Increment Followers") {
                    self.userSettings2.followers += 1
                }
            })
            VStack(content: {
                Text("Followers: \(userSettings3.followers)")
                Button("Increment Followers") {
                    self.userSettings3.followers += 1
                }
            })
        }
    }
}

