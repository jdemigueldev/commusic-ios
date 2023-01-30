//
//  ContentView.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePage()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            ChatPage()
                .tabItem {
                    Image(systemName: "message")
                    Text("Chat")
                }
            AddPostPage()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Add")
                }
            ProfilePage()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
