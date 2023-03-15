import Foundation

enum Endpoint {
    static let baseURL: String = "https://commusic.onrender.com/"
    
    case login
    case register
    case users
    case currentUser
    case posts
    
    var path: String {
        switch self {
        case .login:
            return "token"
        case .register:
            return "users/register"
        case .users:
            return "users"
        case .currentUser:
            return "users/me"
        case .posts:
            return "posts"
        }
    }
    
    var absoluteURL: URL {
        URL(string: Endpoint.baseURL + self.path)!
    }
}
