//
//  SwiftUIView.swift
//  SimpleUIKitProject
//
//  Created by Siroratt Suntronsuk on 28/3/2567 BE.
//

import SwiftUI

//Simple SwiftUI's UI layout
struct SwiftUIView: View {
    var body: some View {
        ZStack {
            Color.pink
            Button("Hello, SwiftUI!") {
                
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

//Advanced SwiftUI's UI layout
struct LoginView: View {
    @State var isLoginMode = false
    
    @State var image: UIImage? = nil
//    @State var showCaptureImageView = false
    
    @State var email = ""
    @State var password = ""
    @State var loginStatusMessage = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
//                    pickerView
                    if !isLoginMode {
                        imagePicker
                    }
                    textField
                    loginSignupButton
                    Button {
                        isLoginMode = !isLoginMode
                    } label: {
                        Text(isLoginMode ? "Create account?": "Login?")
                    }

                    Text(self.loginStatusMessage)
                        .foregroundColor(.teal)
//                    if (showCaptureImageView) {
//                      CaptureImageView(isShown: $showCaptureImageView, image: $image)
//                    }
                }.padding()
            }
            .navigationTitle(isLoginMode ? "Login": "Signup")
            .background(Color.init(white: 0, opacity: 0.05))
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
            
    }
    
}
extension LoginView {
    func buttonDidClick() {
        if isLoginMode {
            print("loginUser")
        } else {
            print("createNewAccount")
        }
    }
}

extension LoginView {
    var imagePicker: some View {
        Group {
        Button {
            print("Button did clicked")
        } label: {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.fill")
                        .font(.system(size: 64))
                        .padding()
                        .foregroundColor(Color(.label))
                }


            }
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
        }
        }
    }
    
    var textField: some View {
        Group {
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            SecureField("Password", text: $password)
        }
        .padding(12)
        .background(Color.white)
    }
    
    var loginSignupButton: some View {
        Button {
            buttonDidClick()
        } label: {
            Spacer()
            Text(isLoginMode ? "Log In" : "Sign up")
                .foregroundColor(.white)
                .padding(.vertical, 10)
                .font(.system(size: 14, weight: .semibold))
            Spacer()
        }.background(.blue)
    }
}


#Preview {
    LoginView()
}
