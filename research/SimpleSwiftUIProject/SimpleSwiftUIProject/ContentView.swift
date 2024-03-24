//
//  ContentView.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 17/3/2567 BE.
//

import SwiftUI
class ViewModel: ObservableObject {
    @Published var name = "" {
        didSet {
            print("set")
            //do whatever you want
        }
    }
}
//simple protocol and delegation pattern can be demo by integration UITextField in SwitftUI project. - see also in swiftUI_Delegation_pattern.playground
struct ContentView: View {
    @State var name = "JAAA"
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField("Enter ja: ", text: $name) //example of pass @state to subview with read-write access
            Text("Hello \(name)") //example of pass @state to subview with read-only access
                .onChange(of: name, { oldValue, newValue in
                    print("username changed from \(oldValue) to \(newValue)")
                })
            
            TextField("Enter StateObject: ", text: $viewModel.name)
            Text("Hello StateObject \(viewModel.name)")
                .onChange(of: viewModel.name, { oldValue, newValue in
                    print("StateObject changed from \(oldValue) to \(newValue)")
                })
            
        }
        .padding()
        .onAppear(perform: {
            Task {
                await callAPIWithAwaitPattern()
            }
            print("onAppear")
        })
        .onDisappear(perform: {
            
            print("onDisappear")
        })
    }
    
    func callAPIWithAwaitPattern() async {
        print("start API call")
        let url = URL(string: "https://www.boredapi.com/api/activity")!
        let _ = try? await URLSession.shared.data(from: url)
        print("complete API call")
    }
}

#Preview {
    ContentView()
}
