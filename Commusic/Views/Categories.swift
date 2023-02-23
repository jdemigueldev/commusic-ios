//
//  Categories.swift
//  Commusic
//
//  Created by Bluyin  on 23/2/23.
//

import SwiftUI

struct Categories: View {
    var body: some View {
        List {
            HStack {
                Image(systemName: "music.mic")
                Text("Singer")
            }
            HStack {
                Image(systemName: "music.note.tv")
                Text("Producer")
            }
            HStack {
                Image(systemName: "music.quarternote.3")
                Text("Beatmaker")
            }
            HStack {
                Image(systemName: "music.note.house")
                Text("Mixing")
            }
            HStack {
                Image(systemName: "mic")
                Text("Trap")
            }
            HStack {
                Image(systemName: "arrow.right.to.line.compact")
                Text("Otros")
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
