import Foundation

struct Token: Decodable {
    let access_token: String
    let token_type: String
    let expires: String
}
