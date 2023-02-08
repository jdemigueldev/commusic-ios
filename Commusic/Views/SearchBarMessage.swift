//
//  SearchBarMessage.swift
//  Commusic
//
//  Created by Bluyin  on 7/2/23.
//

import SwiftUI

struct SearchBarMessage: View {
    
    @State var text: String = ""
    @State private var isEditing = false
    
    var body: some View {
        
        
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search ...", text: $text)
                .foregroundColor(Color("description"))
                .onTapGesture {
                    self.isEditing = true
                    
                }
            if isEditing {
                Button(action: {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    self.isEditing = false
                    self.text = ""
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
                .foregroundColor(Color("description"))
                
            }
        }
        .padding(7)
        .padding(.horizontal, 2)
        .background(Color("backgroundpost"))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .foregroundColor(Color("description"))
        .background (
            RoundedRectangle(cornerRadius: 30).fill(Color("backgroundpost"))
                .softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.black, lightShadow: Color("description"), spread: 0.05, radius: 3)
            
        )
        .padding()
        
        
    }
}

struct SearchBarMessage_Previews: PreviewProvider {
    @State static var text = ""
    static var previews: some View {
        SearchBarMessage()
    }
}
