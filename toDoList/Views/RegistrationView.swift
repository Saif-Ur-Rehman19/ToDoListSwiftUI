//
//  RegistrationView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Register", subTitle: "Start organizing todos", angle: -15, background: .orange)
            Form {
                if viewModel.errorMessage != "" {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                TextField("Full Name", text: $viewModel.name).textFieldStyle(DefaultTextFieldStyle()).autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email).textFieldStyle(DefaultTextFieldStyle()).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password).textFieldStyle(DefaultTextFieldStyle())
                TLDButton(title: "Create Account", background: .green, action: {
                    viewModel.register()
                    
                }).padding()
            }.offset(y: -50)
            Spacer()
        }
    }
}

#Preview {
    RegistrationView()
}
