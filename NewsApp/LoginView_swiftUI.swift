//
//  LoginView.swift
//  ChitChat
//
//  Created by Siroratt Suntronsuk on 22/1/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @State var isLoginMode = false
    
    @State var image: UIImage? = nil
    @State var showCaptureImageView = false
    
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
                    if (showCaptureImageView) {
                      CaptureImageView(isShown: $showCaptureImageView, image: $image)
                    }
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
