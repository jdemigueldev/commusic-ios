//
//  PostItem.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct PostItem: View , Hashable{
    
    var post: Post
    
    var body: some View {
        
    
            HStack {
                AsyncImage(url: URL(string: ""))
                //.frame(width: 300, height: 150)
                    .frame(maxWidth: 300, maxHeight: 150, alignment: .leading)
                    .background(Color("AccentColor"))
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.title3)
                        .bold()
                    //precio con solo dos decimales
                    Text("$ \(post.price, specifier: "%.2f")")
                        .font(.caption)
                    
                    
                }.padding(8)
                
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .padding()
                }
                .frame(maxHeight: 150, alignment: .bottom)
            }
        
        .background(Color("SurfaceBackground"))
        .cornerRadius(10)
        .padding(.trailing)
        }
    }


struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem(post: Post(post_id: 1, user_id: 1, title: "Estudio Maricarmen", description: "Description", price: 1, upload_date: ""))
    }
}
