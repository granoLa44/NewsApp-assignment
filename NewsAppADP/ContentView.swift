//
//  ContentView.swift
//  NewsAppADP
//

import SwiftUI

struct ContentView: View {
    @StateObject private var favoritesVM = FavoritesListViewModel()
    @StateObject private var newsVM = NewsListViewModel()
    @StateObject private var favoritesManager = FavoritesManager()
    
    
    var body: some View {
        TabView {
            
            Tab("News", systemImage: "newspaper.fill") {
                NewsListView()
                    .environmentObject(newsVM)
            }
            

            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesListView()
                    .environmentObject(favoritesVM)
            }
        }
        .environmentObject(favoritesManager)
        
    }
}

#Preview {
    ContentView()
}
