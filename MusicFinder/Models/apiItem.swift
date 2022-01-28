//
//  apiItem.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import Foundation

struct apiItem: Codable, Identifiable {
    let id: UUID = UUID()
    var artistName: String?
    var trackCount: Int?
    var trackName: String?
    var collectionName: String?
    var artworkUrl60: String
    var trackViewUrl: String?
    var collectionViewUrl: String?
}

