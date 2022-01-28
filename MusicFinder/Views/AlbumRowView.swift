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
                Text(item.collectionName ?? "hi")
                    .font(.headline)
                Text(item.artistName ?? "hi")
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
        AlbumRowView(item: apiItem(artistName: "Test Artist", trackCount: 0, trackName: "Test Track", collectionName: "Test Album", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/72/da/6b/72da6b25-b70c-059c-6a93-c6278f83e6bb/source/60x60bb.jpg", trackViewUrl: "https://music.apple.com/us/album/gorgeous/1440933849?i=1440934258&uo=4"))
    }
}
