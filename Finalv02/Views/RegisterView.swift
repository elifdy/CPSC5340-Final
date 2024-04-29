//
//  RegisterView.swift
//  Finalv02
//
//  Created by Elif Dede on 4/17/24.
//


import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewModel()
    let buttonColor = Color(red: 255/255, green: 139/255, blue: 148/255)
   
    var body: some View {
        VStack{
            LogoView()
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                MLButton(
                    title: "Create Account",
                    background: buttonColor
                ) {
                    viewModel.register()
                }.padding()
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

