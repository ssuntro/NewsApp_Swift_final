//
//  LoginView.swift
//  NewsApp
//
//  Created by Siroratt Suntronsuk on 17/1/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @State var isLoginMode = false
    @State var email = ""
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
                    
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
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
