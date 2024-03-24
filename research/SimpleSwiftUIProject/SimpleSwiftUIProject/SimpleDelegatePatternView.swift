//
//  SimpleDelegatePatternView.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 24/3/2567 BE.
//


import SwiftUI

protocol SomeDelegate {
    func didCompleteTask(data: String)
}

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

struct SimpleDelegatePatternView: View {
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

extension SimpleDelegatePatternView: SomeDelegate {
    func didCompleteTask(data: String) {
        print("Handle the completion: \(data)")
        isTaskCompleted = true
    }
}


#Preview {
    SimpleDelegatePatternView()
}

