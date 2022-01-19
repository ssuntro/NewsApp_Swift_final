//
//  LoginView.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 17/1/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @State var isLoginMode = false
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Picker(selection: $isLoginMode,
                           label: Text("Picker")) {
                        Text("Login")
                            .tag(true)
                        Text("Signup")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }.navigationTitle(isLoginMode ? "Login": "Signup")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
