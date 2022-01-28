//
//  SongRowView.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import SwiftUI

struct SongRowView: View {
    var item: apiItem
    
    var body: some View {
        HStack {
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
                Text(item.trackName ?? "hi")
                    .font(.headline)
                Text(item.collectionName ?? "hi")
            }
            Spacer()
            Link(destination: URL(string: item.trackViewUrl ?? "")!, label: {
                Image(systemName: "play.circle")
            })
        }
    }
}

struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(item: apiItem(artistName: "Taylor Swift", trackName: "Sample Track", collectionName: "Sample Album", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/72/da/6b/72da6b25-b70c-059c-6a93-c6278f83e6bb/source/60x60bb.jpg", trackViewUrl: "https://music.apple.com/us/album/gorgeous/1440933849?i=1440934258&uo=4"))
    }
}
