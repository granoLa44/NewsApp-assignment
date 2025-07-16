//
//  ContentView.swift
//  NewsAppADP
//

import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesVM = FavoritesListViewModel()
    @StateObject private var newsVM = NewsListViewModel()
    
    var body: some View {
        TabView {
            
            Tab("News", systemImage: "newspaper.fill") {
                NewsListView()
            }


            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesListView()
            }

        }
        .environmentObject(favoritesVM)
        .environmentObject(newsVM)
    }
}

#Preview {
    ContentView()
}
