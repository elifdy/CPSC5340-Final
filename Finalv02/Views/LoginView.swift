//
//  LoginView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    let buttonColor = Color(red: 255/255, green: 139/255, blue: 148/255)
    var body: some View {
        NavigationView {
            VStack{
                LogoView()
                Form {
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $loginViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $loginViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    MLButton(
                        title: "Login",
                        background: buttonColor
                    ) {
                        loginViewModel.login()
                    } .padding()
                }
                VStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

 
