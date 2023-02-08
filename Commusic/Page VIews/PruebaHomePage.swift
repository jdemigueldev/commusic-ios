import SwiftUI
import Neumorphic

struct PruebaHomePage: View {
    
    @State var searchText = ""
    @State var postsList = [Post]()
    @State private var currentPage = 0
    
    
    var body: some View {
        
        NavigationView {
            //ViewThatFits {
            VStack {
                HStack {
                    Button(action: { }) {
                        Text("Producer")
                    }
                    Button(action: { }) {
                        Text("Beatmaker")
                    }
                    Button(action: { }) {
                        Text("Trap")
                    }
                    Button(action: { }) {
                        Text("Pop")
                    }
                }
                .padding(1)
                .buttonStyle(.borderedProminent)
                .tint(Color("backgroundpost"))
                .foregroundColor(Color("description"))
                
                List {
                    ForEach(filteredPostsList, id: \.id) { post in
                        NavigationLink(destination: DetailsPage()) {
                            PostItem(post: post)
                                .scaledToFit()
                        }
                    }
                    .listRowBackground(Color("SurfaceBackground"))
                    //.listRowInsets(EdgeInsets()) //0 padding
                    .onAppear {
                        if postsList.count > 0 && postsList.count % 20 == 0 {
                            self.loadNextPage()
                        }
                    }
                }
                .searchable(text: $searchText)
                .listStyle(PlainListStyle())
                .background(Color("SurfaceBackground"))
                .scrollContentBackground(.hidden)
                .task {
                    postsList = await getPosts()
                }
            }
            .background(Color("SurfaceBackground"))
            
        }
    }
    
    var filteredPostsList: [Post] {
        return searchText == "" ? postsList : postsList.filter { post in
            post.title.contains(searchText) || post.description.contains(searchText)
        }
    }
    
    private func loadNextPage() {
        currentPage += 1
        // Load next set of data here, based on the currentPage value
    }
    
    
    //Getting data
    
    private func getPosts() async -> [Post]  {
        let url = URL(string: "https://commusic.onrender.com/posts")!
        
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            print("ERROR!! No hay datos.")
            
            return []
        }
        
        do {
            let postsList = try JSONDecoder().decode([Post].self, from: data)
            print(postsList)
            return postsList
            
        } catch {
            print(error)
        }
        
        return []
        
    }
}

struct PruebaHomePage_Previews: PreviewProvider {
    static var previews: some View {
        PruebaHomePage()
    }
}
