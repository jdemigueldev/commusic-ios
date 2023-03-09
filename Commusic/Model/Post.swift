
import Foundation

public struct Post: Decodable, Identifiable {
    public let id: Int
    let user_id: Int
    let title: String
    let description: String
    let price: Int
    let upload_date: String
    let photo: Photo?
    let user: User
}

public struct Photo: Decodable, Identifiable {
    public let id: Int
    let content: String
    let order: Int
}

struct PostCreate: Encodable {
    let user_id: Int
    let title: String
    let description: String
    let price: Int
}
