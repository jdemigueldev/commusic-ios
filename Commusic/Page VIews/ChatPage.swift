import SwiftUI


struct ChatListView: View {
    
    var chats = ["Manoli", "Beckam", "Jazinto", "Richat", "Hitler","Figo","Marcelo","Cr7"]
    
    @State private var searchText = ""
    
    
    
    var filteredChats: [String] {
        if searchText.isEmpty {
            return chats
        } else {
            return chats.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List(filteredChats, id: \.self) { chat in
                    NavigationLink(destination: ChatView()) {
                        ChatRow(chatName: chat)
                        
                    }.listRowSeparatorTint(.gray)
                        
                        
                }
                .padding(.trailing, 20)
                .padding(.top, 20)
                .listStyle(PlainListStyle())
                .searchable(text: $searchText) {
                }
            }
        }.preferredColorScheme(.dark)
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
        VStack {
            HStack {
                Text("Detalle del chat \(chatName)")
                    .navigationBarTitle(chatName)
            }
        }
    }
}


struct ChatPage_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
