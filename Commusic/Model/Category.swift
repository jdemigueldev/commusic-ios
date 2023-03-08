//
//  Category.swift
//  Commusic
//
//  Created by Bluyin  on 8/3/23.
//

import Foundation

struct Category: Identifiable {
    let id: Int
    let name: String
    let systemImage: String
}

extension Category {
    static let sampleData: [Category] =
    [
        Category(id: 1, name: "Singer", systemImage: "music.mic"),
        Category(id: 2, name: "Producer", systemImage: "music.note.tv"),
        Category(id: 3, name: "Beatmaker", systemImage: "music.quarternote.3"),
        Category(id: 4, name: "Mixing", systemImage: "music.note.house"),
        Category(id: 5, name: "Trap", systemImage: "mic"),
        Category(id: 6, name: "Otros", systemImage: "arrow.right.to.line.compact")
    ]
}
