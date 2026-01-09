//
//  ContentView.swift
//  PeopleHub
//
//  Created by Hafizur Rahman on 9/1/26.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        List(users) { user in
            Text(user.name)
        }
        .task {
            users = await fetchData()
        }
    }
    
    func fetchData() async -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid Url")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode([User].self, from: data)
            return decodedData
        } catch {
            print("Failed to fetch data")
            return []
        }
        
    }
}

#Preview {
    ContentView()
}
