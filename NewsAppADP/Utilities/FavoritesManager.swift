//
//  FavoritesManager.swift
//  NewsAppADP
//
//  Created by Lara on 25.07.2025..
//

import Foundation

final class FavoritesManager: ObservableObject {
    
    @Published var favoriteArticles: [Article] = []
    static let shared = FavoritesManager()
    
    func toggleFavorite(article: Article) {
        if favoriteArticles.contains(where: { $0.id == article.id }) {
            favoriteArticles = favoriteArticles.filter(){$0.id != article.id}
        } else {
            favoriteArticles.append(article)
        }
    }
    
    func isFavorite(article: Article) -> Bool {
        favoriteArticles.contains{$0.id == article.id}
    }
}
