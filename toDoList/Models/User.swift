//
//  User.swift
//  toDoList
//
//  Created by uExel on 10/07/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
