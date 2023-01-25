//
//  SearchBar.swift
//  Commusic
//
//  Created by Bluyin  on 24/1/23.
//

import SwiftUI


struct SearchBar: View {
    
    
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
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
            }
        }
    }
}
//no se puede probar en preview
struct SearchBar_Previews: PreviewProvider {
   @State static var text = ""
    static var previews: some View {
        SearchBar(text: $text)
    }
}
