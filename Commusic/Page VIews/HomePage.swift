
import SwiftUI

struct HomePage: View {
    
    @State var Searchtext = ""
    @State private var currentPage = 0
    var posts = [PostItem(post: Post(post_id: 1, user_id: 1, title: "Estudio Maricarmen", description: "Description", price: 1, upload_date: ""))]
    
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(text: $Searchtext)
                List {
                    
                    ForEach(posts, id: \.self) { item in
                        NavigationLink(destination: DetailsPage()) {
                            PostItem(post: Post(post_id: 1, user_id: 1, title: "Estudio Maricarmen", description: "Description", price: 1, upload_date: ""))
                                .padding(8)
                        }
                        
                    }
                    .onAppear {
                        if posts.count > 0 && posts.count % 20 == 0 {
                            self.loadNextPage()
                        }
                    }
                    .task {
                        let postsList = await getPosts()
                    }
                }
                Spacer()
                
            }.navigationTitle("Commusic")
            
        }
        
        
    }
    private func loadNextPage() {
        currentPage += 1
        // Load next set of data here, based on the currentPage value
    }
    
    
    private func getPosts() async -> [Post] {
        let url = URL(string: "https://commusic.onrender.com/posts")!
        
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            print("ERROR!! No hay datos.")
            return []
        }
        
        do {
            let postsList = try JSONDecoder().decode([Post].self, from: data)
            return postsList
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}

struct ApiList_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
