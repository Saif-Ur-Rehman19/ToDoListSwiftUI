//
//  ProfileView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let user = viewModel.user {
                    Image(systemName: "person.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.blue).frame(width: 125, height: 125).padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:").bold()
                            Text(user.name)
                        }.padding()
                        HStack {
                            Text("Email").bold()
                            Text(user.email)
                        }.padding()
                        HStack {
                            Text("Member Since:").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
                    }.padding()
                    Button {
                        viewModel.logout()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10).frame(width: UIScreen.main.bounds.width - 100, height: 33)
                            Text("Log Out").foregroundColor(.white)
                        }
                    }.tint(.red)
                } else {
                    Text("Loading Profile...")
                }

            }.navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
