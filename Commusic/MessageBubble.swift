//
//  MessageBubble.swift
//  Commusic
//
//  Created by Bluyin  on 2/3/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack (alignment: message.received ? .leading : .trailing){
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color.gray : Color.indigo)
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.white)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}
struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "Ive been coding swiftUI so long time ago and is fun, i like boobs and penises", received: true, timestamp: Date()))
    }
}
