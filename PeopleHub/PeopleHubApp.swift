//
//  PeopleHubApp.swift
//  PeopleHub
//
//  Created by Hafizur Rahman on 9/1/26.
//

import SwiftData
import SwiftUI

@main
struct PeopleHubApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
