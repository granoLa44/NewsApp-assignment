//
//  FavoritesListView.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//
import SwiftUI

struct FavoritesListView: View {
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                if FavoritesManager.shared.favoriteArticles.isEmpty {
                    Text("No favorite articles yet.")
                } else {
                    LazyVStack {
                        ForEach(FavoritesManager.shared.favoriteArticles) { article in
                            NavigationLink(destination: ArticleDetailView(article: article)){
                                ArticleCell(article: article)}.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .navigationTitle("Favorite articles")
        }
        
    }
}

#Preview {
    FavoritesListView()
}
