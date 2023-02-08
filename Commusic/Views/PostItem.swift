//
//  PostItem.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct PostItem: View {
    var post: Post
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: ""))
            .frame(width: 130, height: 150)
                .frame(maxWidth: 300, maxHeight: 150, alignment: .leading)
                //.background(Color("AccentColor"))
                .aspectRatio(contentMode: .fit)
                
                
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color("titlepost"))
                    .scaledToFit()
                Text(post.description)
                    .foregroundColor(Color("description"))
                    .scaledToFit()
                //precio
                Text("$\(post.price)")
                    .padding(.top, 1)
                    .font(.caption)
                    .foregroundColor(Color("description"))
                    .scaledToFit()
            }.padding(8)
            
            Button(action: {}) {
                Image(systemName: "bookmark")
                    .padding()
            }
            .frame(maxHeight: 150, alignment: .bottom)
        }
        .background(Color("backgroundpost"))
        .cornerRadius(10)
        //.padding(.trailing)
        .scaledToFit()
        
        
    }
    
}

struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem(post: Post(id: 1, user_id: 1, title: "Estudio Maricarmen", description: "Description", price: 5, upload_date: ""))
    }
}
