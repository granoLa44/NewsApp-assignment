//
//  FavoritesListViewModel.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//

import SwiftUI

final class FavoritesListViewModel: ObservableObject {
    
    @Published var favoriteArticles: [Article] = []
    
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
