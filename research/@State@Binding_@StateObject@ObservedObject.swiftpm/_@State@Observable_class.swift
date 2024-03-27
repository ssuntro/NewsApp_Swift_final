//
//  @StateWith@observable.swift
//  @State@Binding_@StateObject@ObservedObject
//
//  Created by Siroratt Suntronsuk on 26/3/2567 BE.
//

import SwiftUI

//Ref - https://developer.apple.com/documentation/swiftui/state#Share-observable-state-objects-with-subviews
@available(iOS 17.0, *)
@Observable
class Book {
    var title = "A sample book"
    var isAvailable = true
}

@available(iOS 17.0, *)
private struct ParentView: View {
    @State private var book = Book()


    var body: some View {
        Text("\(book.title)")
        TextField("new title:", text: $book.title)
        BookView(book: book)
    }
}

@available(iOS 17.0, *)
// BookView need @binding only when you need to change the reference stored in state in some other subview, such as setting the reference to nil. To change properties of that object as below @binding is not required/
struct BookView: View {
    var book: Book


    var body: some View {
        Text(book.title)
        Button(action: { book.title = "Annjs" }, label: {
            Text("Button")
        })
    }
}

@available(iOS 17.0, *)
#Preview {
    ParentView()
}
