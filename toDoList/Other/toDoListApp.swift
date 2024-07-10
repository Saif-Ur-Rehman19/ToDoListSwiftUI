//
//  toDoListApp.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import FirebaseCore
import SwiftUI

@main
struct toDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
