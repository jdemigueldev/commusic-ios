//
//  Message.swift
//  Commusic
//
//  Created by Bluyin  on 2/3/23.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
