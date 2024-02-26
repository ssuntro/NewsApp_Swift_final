import SwiftUI

protocol SomeDelegate {
    func didCompleteTask(data: String)
}

//Create communication from TableView to other component using Delegate pattern.
//In UIKit, same idea but difference example, UITableViewDelegate.
//Whereas, communication from SomeView to TableView can be done by simple method execution.

struct TableView: View {
    @State private var taskData: String = ""
    var delegate: SomeDelegate?

    var body: some View {
        VStack {
            TextField("Enter task data", text: $taskData)
                .padding()
            Button("Complete Task") {
                delegate?.didCompleteTask(data: taskData)
            }
        }
    }
}

struct SomeView: View {
    @State private var isTaskCompleted = false

    var body: some View {
        TableView(delegate: self) //can be self or anyComponent that comply SomeDelegate
            .onAppear {
                print("View onAppear")
            }
            .onDisappear {
                print("View onDisappear")
            }
    }
}

extension SomeView: SomeDelegate {
    func didCompleteTask(data: String) {
        print("Handle the completion: \(data)")
        isTaskCompleted = true
    }
}

import PlaygroundSupport
let viewController = UIHostingController(rootView: SomeView())
PlaygroundPage.current.liveView = viewController
