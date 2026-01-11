import SwiftData
import Foundation

@Model
final class User: Decodable {
    var id: String
    var name: String
    @Relationship(deleteRule: .cascade) var friends: [Friend]
    var isActive: Bool
    var age: Int
    var address: String
    var company: String
    var email: String
    var about: String
    var registered: Date
    var tags: [String]
    
    
    init(id: String, name: String, friends: [Friend], isActive: Bool, age: Int, address: String, company: String, email: String, about: String, registered: Date, tags: [String]) {
        self.id = id
        self.name = name
        self.friends = friends
        self.isActive = isActive
        self.age = age
        self.address = address
        self.company = company
        self.email = email
        self.about = about
        self.registered = registered
        self.tags = tags
    }
    
    enum CodingKeys: String, CodingKey {
        case id, name, friends, isActive, age, address, company, email, about, registered, tags
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let friends = try container.decode([Friend].self, forKey: .friends)
        let isActive = try container.decode(Bool.self, forKey: .isActive)
        let age = try container.decode(Int.self, forKey: .age)
        let address = try container.decode(String.self, forKey: .address)
        let company = try container.decode(String.self, forKey: .company)
        let email = try container.decode(String.self, forKey: .email)
        let about = try container.decode(String.self, forKey: .about)
        let registered = try container.decode(Date.self, forKey: .registered)
        let tags = try container.decode([String].self, forKey: .tags)
        
        self.init(id: id, name: name, friends: friends, isActive: isActive, age: age, address: address, company: company, email: email, about: about, registered: registered, tags: tags)
    }
}
