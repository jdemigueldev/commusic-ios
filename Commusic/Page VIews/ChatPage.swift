//
//  ChatView.swift
//  Commusic
//
//  Created by Bluyin  on 30/1/23.
//

import SwiftUI

struct ChatPage: View {
    var body: some View {
        
        
        
        NavigationView {
            
            //ViewThatFits {
            VStack {
                
                HStack {
                    SearchBarMessage()
                        .padding(.top)
                        .padding(.trailing, 70)
                        .padding(.leading, 70)
                }
                Spacer()
               
            }.background(Color("SurfaceBackground"))
            
        }
    }
}
struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatPage()
    }
}
