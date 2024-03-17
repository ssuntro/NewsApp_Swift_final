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

struct ContentView: View {
    @State var name = "JAAA"
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            TextField("Enter ja: ", text: $name)
            Text("Hello \(name)")
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
            print("onAppear")
        })
        .onDisappear(perform: {
            print("onDisappear")
        })
    }
}

#Preview {
    ContentView()
}
