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
                
                Rectangle()
                        .frame(height: 1)
                        .padding(.leading, 70)
                        .padding(.trailing, 70)
                        .foregroundColor(.gray)
                
                Spacer()
                
                List {
                    ForEach(categories) { category in
                        NavigationLink(destination: AddPostPage(category: category)) {
                            HStack {
                                Image(systemName: category.systemImage)
                                Text(category.name)
                                
                            }
                        }//.listRowBackground(Color.purple)
                    }
                }
                
            }.preferredColorScheme(.dark)
        }

    }
}

struct CategoryPage_Previews: PreviewProvider {
    static var previews: some View {
        CategoryPage(categories: Category.sampleData)
    }
}
