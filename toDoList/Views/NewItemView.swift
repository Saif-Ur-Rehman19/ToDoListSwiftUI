//
//  NewItemView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item").font(.system(size: 32)).bold().padding(.top, 50)
            Form {
                // Name Titel
                TextField("Title", text: $viewModel.title).textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                // Button
                TLDButton(title: "Save", background: .pink) {
                    viewModel.save()
                    newItemPresented = false
                }.padding()
                
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
