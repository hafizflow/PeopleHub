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
                InfoRow(title: "Registered", value: user.registered.formatted(date: .abbreviated, time: .shortened))
            }
            
            Section(header: StickyHeader(title: "Tags")) {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
                            Tag(tag: tag)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
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
                .foregroundStyle(.primary)
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


struct Tag: View {
    let tag: String
    
    var body: some View {
        Text(tag)
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .glassEffect()
    }
}
