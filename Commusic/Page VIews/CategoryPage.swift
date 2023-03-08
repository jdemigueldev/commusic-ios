//
//  CategoryPage.swift
//  Commusic
//
//  Created by Bluyin  on 23/2/23.
//

import SwiftUI

struct CategoryPage: View {
    let categories: [Category]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Selecciona una categoria")
                    .padding()
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Spacer()
                
                List {
                    ForEach(categories) { category in
                        NavigationLink(destination: AddPostPage(category: category)) {
                            HStack {
                                Image(systemName: category.systemImage)
                                Text(category.name)
                            }
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
        CategoryPage(categories: Category.sampleData)
    }
}
