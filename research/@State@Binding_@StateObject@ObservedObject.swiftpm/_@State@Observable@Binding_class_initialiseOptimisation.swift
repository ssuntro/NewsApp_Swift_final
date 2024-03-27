//
//  @State@Observable_class_initialiseOptimisation.swift
//  @State@Binding_@StateObject@ObservedObject
//
//  Created by Siroratt Suntronsuk on 26/3/2567 BE.
//

import SwiftUI


@available(iOS 17.0, *)
private struct ParentView: View {
    @State private var book: Book?


    var body: some View {
        Text("\(book?.title ?? "")")
        DeleteBookView(book: $book)
            .task {
                book = Book()
            }
    }
}

@available(iOS 17.0, *)
struct DeleteBookView: View {
    @Binding var book: Book?


    var body: some View {
        Text("\(book?.title ?? "")")
        Button("Delete book") {
            book = nil
//            book?.title = "Ann js"
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    ParentView()
}
