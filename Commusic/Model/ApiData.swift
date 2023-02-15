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
