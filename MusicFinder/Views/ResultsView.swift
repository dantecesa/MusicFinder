//
//  ResultsView.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import SwiftUI

struct ResultsView: View {
    @State var results: [apiItem] = []
    let searchQuery: String
    let searchType: String
    
    var body: some View {
        List {
            ForEach(results) { item in
                if searchType == "song" {
                    SongRowView(item: item)
                } else {
                    AlbumRowView(item: item)
                }
            }
        }
        .task {
            await loadData(withSearchQuery: searchQuery, withSearchType: searchType)
        }
        .navigationTitle(searchQuery)
    }
    
    func loadData(withSearchQuery: String, withSearchType: String) async {
        let santizedSearchQuery = withSearchQuery.replacingOccurrences(of: " ", with: "+").lowercased()
        print(santizedSearchQuery)
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(santizedSearchQuery)&entity=\(withSearchType)&attribute=allArtistTerm") else {
            fatalError("Invalid URL")
        }
        print(url)
        print("URL complete. Starting fetch")
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
        
        print("Fetch complete")
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(results: [apiItem(trackName: "Test Song", collectionName: "Test Collection", artworkUrl60: "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/72/da/6b/72da6b25-b70c-059c-6a93-c6278f83e6bb/source/60x60bb.jpg", trackViewUrl: "https://music.apple.com/us/album/gorgeous/1440933849?i=1440934258&uo=4")], searchQuery: "Taylor Swift", searchType: "song")
    }
}
