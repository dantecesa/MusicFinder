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
                Text(item.trackName ?? "Missing Track Name")
                    .font(.headline)
                Text(item.collectionName ?? "Missing Album Name")
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
        SongRowView(item: apiItem(artistName: "Taylor Swift", collectionName: "1989", artworkUrl60: "", collectionViewUrl: "http://www.google.com", trackCount: 12, trackName: "A track", trackViewUrl: "http://www.google.com"))
    }
}
