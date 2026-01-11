import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        List {
            Section(header: StickyHeader(title: "Friends 🤝")) {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            .listRowSeparator(.hidden)
            
            Section(header: StickyHeader(title: "Personal Information")) {
                InfoRow(title: "Age", value: "\(user.age)")
                InfoRow(title: "Company", value: user.company)
                InfoRow(title: "Email", value: user.email)
                InfoRow(title: "Address", value: user.address)
                InfoRow(title: "About", value: user.about)
            }
        }
        .listStyle(.plain)
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct StickyHeader: View {
    let title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .font(.title.bold())
                .fontDesign(.rounded)
                .padding(.horizontal)
                .foregroundStyle(.black)
                .glassEffect()
        }
        .transition(.move(edge: .top).combined(with: .opacity))
        .animation(.easeInOut(duration: 0.25), value: title)

    }
}


struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.headline)
                .foregroundStyle(.secondary)
            
            Text(value)
                .font(.body)
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    DetailView(user: User(id: "hafiz", name: "hafiz", friends: [], isActive: false, age: 25, address: "hafiz", company: "non", email: "hafiz", about: "hafiz"))
}

