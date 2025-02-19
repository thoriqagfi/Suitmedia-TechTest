//
//  User.swift
//  Suitmedia-TechTest
//
//  Created by Agfi on 19/02/25.
//

import Foundation

struct UserResponse: Decodable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
}

struct User: Decodable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
