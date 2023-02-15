
import Foundation

public struct UserDetails: Decodable, Identifiable {
    public var id: Int
    var username: String
    var email: String
    var full_name: String
    var description: String
    var birth_date: Date
    var profile_picture: String
    var register_date: Date
}

public struct User: Decodable {
    var username: String
    var email: String
    var full_name: String
    var profile_picture: String?
}
