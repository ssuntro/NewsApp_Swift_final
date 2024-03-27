import SwiftUI

class User: ObservableObject {
    @Published var name: String = "eiei"
}

struct ContentView: View {
    @StateObject var user = User()

    @State private var message = ""
    @State private var isPlaying: Bool = false
    var body: some View {
        VStack {
            
            TextField("Enter your counter", text: $message)
            Text("\(isPlaying)")
            PlayButton(isPlaying: $isPlaying)
            Button(message) {
                message = "Ann ja"
            }
            
//            Text("Your name is \(user.name)")
//            TextField("Enter your name", text: $user.name)
            Text("CFGetRetainCount: \(CFGetRetainCount(user))")
//            SubView(user: user)
//                .background(Color.green)
        }
    }
}

struct SubView: View {
    @ObservedObject var user: User

    var body: some View {
        Text("Hello, \(user.name)")
            .onReceive(user.$name) { newName in
                print("User name changed to \(newName)")
            }
        TextField("Inner view", text: $user.name)
        Text("CFGetRetainCount: \(CFGetRetainCount(user))")
    }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
//            print(CFGetRetainCount(isPlaying))
        }
    }
}
#Preview {
    ContentView(user: User())
}
