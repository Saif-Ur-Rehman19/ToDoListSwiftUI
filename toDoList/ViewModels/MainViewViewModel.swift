//
//  MainViewViewModel.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import Foundation
import FirebaseAuth


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ _, user in
            DispatchQueue.main.async {
                self.currentUserId = user?.uid ?? ""
            }
        })
        
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
        
    }
}
