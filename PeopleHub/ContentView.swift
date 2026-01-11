import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack(spacing: 16) {
                        Text(user.isActive ? "🟢" : "🔴")
                        Text(user.name)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("User")
            .toolbarTitleDisplayMode(.inlineLarge)
            .navigationDestination(for: User.self) { user in
                DetailView(user: user)
            }
            .task {
                if users.isEmpty {
                    users = await fetchData()
                }
            }
        }
    }
    
    func fetchData() async -> [User] {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid Url")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedData = try decoder.decode([User].self, from: data)
            
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
