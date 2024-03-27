//
//  EnvironmentObject.swift
//  SimpleSwiftUIProject
//
//  Created by Siroratt Suntronsuk on 27/3/2567 BE.
//

import SwiftUI
struct Book {
    var isAvailable = false
//    let name: String
}


@Observable
class Library {
    var books: [Book] = [Book(isAvailable: true), Book(), Book()]


    var availableBooksCount: Int {
        books.filter(\.isAvailable).count
        
    }
}


//@main
//struct BookReaderApp: App {
struct BookReaderApp: View {
    @State private var library = Library()


//    var body: some Scene {
    var body: some View {
//        WindowGroup {
            LibraryView()
                .environment(library)
//        }
    }
}

struct LibraryView: View {
    @Environment(Library.self) private var library


    var body: some View {
        Text("\(library.availableBooksCount)")
    }
}


#Preview {
    BookReaderApp()
}
