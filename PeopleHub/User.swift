//
//  User.swift
//  PeopleHub
//
//  Created by Hafizur Rahman on 9/1/26.
//

import Foundation


class User: Codable, Identifiable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
