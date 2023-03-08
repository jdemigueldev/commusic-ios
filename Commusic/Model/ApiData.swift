import Foundation
import SwiftUI

public func getPosts() async -> [Post]  {
    let url = URL(string: "https://commusic.onrender.com/posts")!
    
    guard let (data, _) = try? await URLSession.shared.data(from: url) else {
        print("ERROR!! No hay datos.")
        
        return []
    }
    do {
        let postsList: [Post]  = try JSONDecoder().decode([Post].self, from: data)
        print(postsList)
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


