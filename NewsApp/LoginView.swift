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
    @State var password = ""
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
                    
                    if !isLoginMode {
                        Button {
                            imageButtonDidClick()
                        } label: {
                            Image(systemName: "person.fill")
                        }

                    }
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $password)
                    
                    Button {
                        buttonDidClick()
                    } label: {
                        Text(isLoginMode ? "Log In" : "Sign up")
                    }
                }
            }.navigationTitle(isLoginMode ? "Login": "Signup")
        }
    }
    
    func buttonDidClick() {
        
    }
    
    func imageButtonDidClick() {
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
