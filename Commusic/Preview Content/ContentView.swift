//
//  ContentView.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        NavigationView {
            TabView {
                HomePage()
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
                ProfilePage()
                    .tabItem {
                        Image(systemName: "person")
                        
                    }.toolbarBackground((Color("backgroundpost")),for: .tabBar)
            }
            .accentColor(Color("titlepost"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
