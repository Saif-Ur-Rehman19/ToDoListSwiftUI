//
//  TLDButton.swift
//  toDoList
//
//  Created by uExel on 12/07/2024.
//

import SwiftUI

struct TLDButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10).foregroundColor(background)
                Text(title).foregroundColor(.white).bold()
            }
        }).padding()
    }
}

#Preview {
    TLDButton(title: "Value", background: Color.blue, action: {})
}
