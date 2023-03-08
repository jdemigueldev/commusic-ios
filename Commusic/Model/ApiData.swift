import Foundation

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
    
    URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error)
      } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
      }
    }).resume()
}
