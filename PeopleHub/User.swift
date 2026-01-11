//
//  User.swift
//  PeopleHub
//
//  Created by Hafizur Rahman on 9/1/26.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var friends: [Friend]
    var isActive: Bool
    var age: Int
    var address: String
    var company: String
    var email: String
    var about: String
}
