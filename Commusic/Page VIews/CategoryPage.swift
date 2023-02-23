//
//  CategoryPage.swift
//  Commusic
//
//  Created by Bluyin  on 23/2/23.
//

import SwiftUI

struct CategoryPage: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Selecciona una categoria")
                    .padding()
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                List {
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "music.mic")
                            Text("Singer")
                        }
                    }
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "music.note.tv")
                            Text("Producer")
                        }
                    }
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "music.quarternote.3")
                            Text("Beatmaker")
                        }
                    }
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "music.note.house")
                            Text("Mixing")
                        }
                    }
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "mic")
                            Text("Trap")
                        }
                    }
                    NavigationLink(destination: AddPostPage()) {
                        HStack {
                            Image(systemName: "arrow.right.to.line.compact")
                            Text("Otros")
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }

    }
}

struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage()
    }
}
