
import SwiftUI

struct PostListView: View {
    
    @State var searchText = ""
    @State var postsList = [Post]()
    
    var body: some View {
        
        HStack {
            NavigationView {
                List(filteredPostsList, id: \.id) { post in
                    NavigationLink(destination: PostDetail(post: post), label: {
                        PostCell (post: post)
                    })
                }
                .task {
                    postsList = await getPosts()
                }
                .refreshable {
                    postsList = await getPosts()
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText)
        }
        //.edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
    
    var filteredPostsList: [Post] {
        let searchTextLowercased = searchText.lowercased()
        return searchTextLowercased == "" ? postsList : postsList.filter { post in
            let titleLowercased = post.title.lowercased()
            let descriptionLowercased = post.description.lowercased()
            return titleLowercased.contains(searchTextLowercased) || descriptionLowercased.contains(searchTextLowercased)
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView()
    }
}
