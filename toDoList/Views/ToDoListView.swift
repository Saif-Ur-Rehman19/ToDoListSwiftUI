//
//  ToDoListView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId : String
    init(userId: String) {
        self.userId = userId
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }.navigationTitle("To Do List").toolbar(content: {
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                }).sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                })
            })
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
