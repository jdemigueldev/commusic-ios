import SwiftUI

struct ChatListView: View {
    
    var chats = ["Chat 1", "Chat 2", "Chat 3", "Chat 4", "Chat 5"]
    
    @State private var searchText = ""
    
    var filteredChats: [String] {
        if searchText.isEmpty {
            return chats
        } else {
            return chats.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredChats, id: \.self) { chat in
                NavigationLink(destination: ChatDetailView(chatName: chat)) {
                    ChatRow(chatName: chat)
                }
            }
            .padding()
            .listStyle(PlainListStyle())
            .searchable(text: $searchText) {
            }
        }
    }
}
    
struct ChatRow: View {
    
    var chatName: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(chatName)
                    .font(.headline)
                Text("Último mensaje enviado")
                    .font(.subheadline)
            }
        }
    }
}

struct ChatDetailView: View {
    
    var chatName: String
    
    var body: some View {
        Text("Detalle del chat \(chatName)")
            .navigationBarTitle(chatName)
    }
}


struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
