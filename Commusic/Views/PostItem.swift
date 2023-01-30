//
//  PostItem.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct PostItem: View {
    
    //var post: Post
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: ""))
                .frame(width: 300, height: 150)
                .background(Color("AccentColor"))
                .aspectRatio(contentMode: .fit)
                
            HStack {
                VStack(alignment: .leading) {
                    Text("product.name")
                        .font(.title3)
                        .bold()
                    //precio con solo dos decimales
                    Text("precio")
                        .font(.caption)
                    
                }.padding(8)
                Spacer()
            }
        }
        .background(Color("SurfaceBackground"))
        .cornerRadius(10)
        .padding(.trailing)
        }
    }


struct PostItem_Previews: PreviewProvider {
    static var previews: some View {
        PostItem()
    }
}
