
//  PostListView.swift
//  Commusic
//
//  Created by Bluyin  on 24/1/23.
//

import SwiftUI

struct Model: Hashable, Codable {
   let name: String

}
class ContentViewModel: ObservableObject {
  @Published var items = [Model]()
    //mostrar datos

  func fetchData() {
    let api = "https://superapi.netlify.app/api/db/eventos"
    guard let url = URL(string: api) else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      do {
         if let data = data {
           let result = try JSONDecoder().decode([Model].self, from: data)
           DispatchQueue.main.async {
              self.items = result
           }
         } else {
           print("No data")
         }
      } catch (let error) {
         print(error.localizedDescription)
      }
     }.resume()
  }
}
struct ApiList: View {
    @ObservedObject var viewModel = ContentViewModel()
    @State var Searchtext = ""
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $Searchtext)
                List(viewModel.items, id: \.name) { item in
                    VStack(alignment: .leading) {
                        Text(item.name)
                    }
                }.listStyle(GroupedListStyle())
            }.onAppear(perform: {
                viewModel.fetchData()
            })
            .navigationBarTitle("Post List")
        }
    }
}
struct ApiList_Previews: PreviewProvider {
    static var previews: some View {
        ApiList()
    }
}
