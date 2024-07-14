//
//  ToDoListItemsView.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDolistItemViewViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title).font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))").font(.footnote).foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" :
                        "circle").foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id: "123", title: "get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
