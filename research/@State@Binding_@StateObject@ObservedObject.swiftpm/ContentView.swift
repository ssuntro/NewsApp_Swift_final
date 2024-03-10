import SwiftUI

class User: ObservableObject {
    @Published var name: String = "eiei"
}

struct ContentView: View {
    @StateObject var user = User()

    @State var message = ""
    var body: some View {
        VStack {
            Text("Your name is \(user.name)")
            TextField("Enter your name", text: $user.name)
            TextField("Enter your counter", text: $message)
            InnerView(user: user)
                .background(Color.green)
        }
    }
}
import SwiftUI
struct InnerView: View {
    @ObservedObject var user: User

    var body: some View {
        Text("Hello, \(user.name)")
            .onReceive(user.$name) { newName in
                print("User name changed to \(newName)")
            }
        TextField("Inner view", text: $user.name)
    }
}
#Preview {
    ContentView(user: User())
}
