import SwiftUI

class User: ObservableObject {
    @Published var name: String = "eiei"
    init(name: String) {
        self.name = name
    }
}

struct ContentView: View {
    @StateObject private var user: User = User(name: "ContentView")

    @State private var message = "message"
    @State private var isPlaying: Bool = false
    var body: some View {
        VStack {
            
            TextField("Enter your counter", text: $message) //two-way binding, need to be @State var to create Binding<T> type
            Text("\(isPlaying)")
            Text("Annja") //one-way binding no need to be @State var
            ValueTypeDataBindingButton(isPlaying: $isPlaying)
            Button(message) {
                message = "Ann ja"
            }
            
            Divider()
            Text("Your name is \(user.name)")
            TextField("Enter your name", text: $user.name)
            Text("CFGetRetainCount: \(CFGetRetainCount(user))")
            RefTypeDataBidingView(user: user)
                .background(Color.green)
        }
    }
}

struct RefTypeDataBidingView: View {
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

struct ValueTypeDataBindingButton: View {
    @Binding var isPlaying: Bool

    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
//            print(CFGetRetainCount(isPlaying))
        }
    }
}
#Preview {
    //compile error
//    @State var  a = "uuu"
    ContentView()
    
    
//    ContentView(user: User(name: "Preview"))
//    ContentView(user: User())
}
