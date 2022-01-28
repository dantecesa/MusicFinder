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
        
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(santizedSearchQuery)&entity=\(withSearchType.lowercased().dropLast())&attribute=allArtistTerm") else {
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
        ResultsView(results: [], searchQuery: "Taylor Swift", searchType: "song")
    }
}
