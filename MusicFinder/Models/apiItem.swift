//
//  apiItem.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import Foundation

struct apiItem: Codable, Identifiable {
    let id: UUID = UUID()
    
    // Both Albums & Songs
    var artistName: String?
    var collectionName: String?
    var artworkUrl60: String
    
    // Albums
    var collectionViewUrl: String?
    var trackCount: Int?
    
    // Songs
    var trackName: String?
    var trackViewUrl: String?
}
