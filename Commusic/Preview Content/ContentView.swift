
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        HStack {
            NavigationView {
                TabView {
                    PostListView()
                        .tabItem {
                            Image(systemName: "house")
                            
                        }.toolbarBackground((Color.black),for: .tabBar)
                    
                    ChatListView()
                        .tabItem {
                            Image(systemName: "message")
                            
                        }.toolbarBackground((Color.black),for: .tabBar)
                    CategoryPage(categories: Category.sampleData)
                        .tabItem {
                            Image(systemName: "plus")
                            
                        }.toolbarBackground((Color.black),for: .tabBar)
                    
                    Profile()
                        .tabItem {
                            Image(systemName: "person")
                            
                        }.toolbarBackground((Color.black),for: .tabBar)
                }
            }
            .accentColor(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
