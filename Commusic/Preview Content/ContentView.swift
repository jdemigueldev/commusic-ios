
import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            TabView {
                PostListView()
                    .tabItem {
                        Image(systemName: "house")
                        
                    }.toolbarBackground((Color("backgroundpost")),for: .tabBar)
                
                ChatPage()
                    .tabItem {
                        Image(systemName: "message")
                        
                    }.toolbarBackground((Color("backgroundpost")),for: .tabBar)
                AddPostPage()
                    .tabItem {
                        Image(systemName: "plus")
                        
                    }.toolbarBackground((Color("backgroundpost")),for: .tabBar)
                
                Profile(user: UserDetails(id: 1, username: "MetroBoomin", email: "example@example.com", full_name: "metro", description: "I am a very professional producer who has worked with a lot of artists of the level of Alvarwu, in my social networks you can take a look at everything I do. ", birth_date: Date(), profile_picture: "", register_date: Date()))
                    .tabItem {
                        Image(systemName: "person")
                        
                    }.toolbarBackground((Color("backgroundpost")),for: .tabBar)
            }
            .accentColor(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
