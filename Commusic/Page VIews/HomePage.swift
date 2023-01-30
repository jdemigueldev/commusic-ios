
//  PostListView.swift
//  Commusic
//
//  Created by Bluyin  on 24/1/23.
//

import SwiftUI


struct HomePage: View {
    @State var Searchtext = ""
    var body: some View {
        
        NavigationView {
            VStack {
                SearchBar(text: $Searchtext)
                Spacer()
                List {
                    VStack(alignment: .leading) {
                        NavigationLink {
                            DetailsPage()
                        } label: {
                            PostItem()
                        }
                        
                    }
                }.listStyle(GroupedListStyle())
            }.navigationTitle("Commusic")
        }
    }
}
struct ApiList_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
