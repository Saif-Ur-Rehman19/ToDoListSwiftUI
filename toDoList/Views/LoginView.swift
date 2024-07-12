//
//  LoginView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, background: .pink)
                
                // Login Form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                    
                    TLDButton(title: "Log In", background: .blue, action: {
                        viewModel.login()
                    }).padding()
                }.offset(y: -50)
                
                //Create account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegistrationView())
                }.padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}


