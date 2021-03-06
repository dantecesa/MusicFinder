//
//  ContentView.swift
//  T-Swift
//
//  Created by Dante Cesa on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    @State private var artistName: String = ""
    @State private var searchSelection: Int = 0
    let searchType: [String] = ["Albums", "Songs"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink {
                        Form {
                            Picker("Search Type", selection: $searchSelection) {
                                ForEach(0..<searchType.count) { index in
                                    Text(searchType[index])
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(.inline)
                        }
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle("Search Type")
                    } label: {
                        Text("Search Type")
                    }
                    
                    TextField("Search query", text: $artistName)
                    }
                    
                NavigationLink("Run Search", destination: ResultsView(searchQuery: artistName, searchType: searchType[searchSelection]))
                    .disabled(artistName.isEmpty)
            }
            .navigationTitle("Music Finder")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
