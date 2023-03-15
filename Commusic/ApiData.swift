import Foundation

public func getPosts() async -> [Post]  {
    let url = URL(string: "https://commusic.onrender.com/posts")!
    
    guard let (data, _) = try? await URLSession.shared.data(from: url) else {
        print("ERROR!! No hay datos.")
        
        return []
    }
    do {
        let postsList: [Post]  = try JSONDecoder().decode([Post].self, from: data)
        return postsList
        
    } catch {
        print(error)
    }
    
    return []
}


func createPost(_ post: PostCreate) async {
    var request = URLRequest(url: URL(string: "https://commusic.onrender.com/posts")!)
    request.httpMethod = "POST"
    
    let postData = try? JSONEncoder().encode(post)
    request.httpBody = postData
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    if let bodyData = request.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
        print("Request body: \(bodyString)")
    }
    
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let error = error {
            print("Error: \(error.localizedDescription)")
        } else {
            if let httpResponse = response as? HTTPURLResponse {
                print("Response status code: \(httpResponse.statusCode)")
                if let data = data, let body = String(data: data, encoding: .utf8) {
                    print("Response body: \(body)")
                }
            }
        }
    }.resume()
}

func logIn(login: Login) async -> Bool {
    var request = URLRequest(url: Endpoint.login.absoluteURL)
    
    var requestBodyComponents = URLComponents()
    requestBodyComponents.queryItems = [URLQueryItem(name: "username", value: login.username),
                                        URLQueryItem(name: "password", value: login.password)]
    
    request.httpMethod = "POST"
    request.allHTTPHeaderFields = ["Content-Type" : "application/x-www-form-urlencoded"]
    request.httpBody = requestBodyComponents.query?.data(using: .utf8)
    
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        let token = try JSONDecoder().decode(Token.self, from: data)
        UserDefaultsWorker.shared.saveAuthToken(token: token)
        return true
    }
    catch {
        print(error)
        return false
    }
}

func getLoggedUser() async -> UserDetails {
    let token = UserDefaultsWorker.shared.getAccessToken()!
    
    var request = URLRequest(url: Endpoint.currentUser.absoluteURL)
    request.allHTTPHeaderFields = ["Authorization" : "\(token.token_type) \(token.access_token)"]
    
    let (data, _) = try! await URLSession.shared.data(for: request)
    
    return try! JSONDecoder().decode(UserDetails.self, from: data)
}
