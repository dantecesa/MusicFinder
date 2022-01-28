//
//  AlbumRowView.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import SwiftUI

struct AlbumRowView: View {
    var item: apiItem
    
    var body: some View {
        return HStack {
            AsyncImage(url: URL(string: item.artworkUrl60)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("Error loading image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 60, height: 60)
            
            VStack(alignment: .leading) {
                Text(item.collectionName ?? "Missing Album Name")
                    .font(.headline)
                Text(item.artistName ?? "Missing Artist Name")
            }
            Spacer()
            Link(destination: URL(string: item.collectionViewUrl ?? "")!, label: {
                Image(systemName: "play.circle")
            })
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(item: apiItem(artistName: "Taylor Swift", collectionName: "1989", artworkUrl60: "", collectionViewUrl: "http://www.google.com", trackCount: 12, trackName: "A track", trackViewUrl: "http://www.google.com"))

    }
}
