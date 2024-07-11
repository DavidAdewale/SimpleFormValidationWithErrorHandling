//
//  ContentView.swift
//  HelloSwiftForm
//
//  Created by David Adewale on 11/07/2024.
//

import SwiftUI




struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginFormError = LoginFormError()
    
//    var isLoginValid: Bool {
//        !email.isEmpty && !password.isEmpty && email.isValidEmail
//    }
    
    private func clearForm() {
        loginFormError = LoginFormError()
    }
    
    var isFormValid: Bool {
        clearForm()
        
        if email.isEmpty {
            loginFormError.email = "Email is required!"
        } else if !email.isValidEmail {
            loginFormError.email = "Email is not in correct format!"
        }
        
        if password.isEmpty {
            loginFormError.password = "Password is required!"
        }
        
        return loginFormError.email.isEmpty && loginFormError.password.isEmpty
    }
    
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            if(!loginFormError.email.isEmpty) {
                Text(loginFormError.email)
                    .font(.caption)
            }
            SecureField("Password", text: $password)
            if(!loginFormError.password.isEmpty) {
                Text(loginFormError.password)
                    .font(.caption)
            }
            Button("Login") {
                if isFormValid {
                    //submit the form
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
