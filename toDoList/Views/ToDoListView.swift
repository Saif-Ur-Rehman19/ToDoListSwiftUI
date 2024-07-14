//
//  ToDoListView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            VStack {
                List(items) {
                    item in
                    ToDoListItemView(item: item).swipeActions {
                        Button(action: {
                            viewModel.delete(id: item.id)
                        }, label: {
                            Text("Delte")
                        }).tint(.red)

                        }
                    }.listStyle(PlainListStyle())
                    
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
