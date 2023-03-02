//
//  ChatView.swift
//  Commusic
//
//  Created by Bluyin  on 2/3/23.
//

import SwiftUI

struct ChatView: View {
    var messageArray = ["Hello you", "How are you doing ?", "Ibe been building apps in swiftUI from scratch and its so funn"]
    
    var body: some View {
        VStack {
            VStack {
                TitleRow()
                
                ScrollView {
                    ForEach(messageArray, id: \.self) { text in
                        MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            
            MessageField()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
