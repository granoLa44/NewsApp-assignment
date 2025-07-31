//
//  FavoriteButton.swift
//  NewsAppADP
//
//  Created by Lara on 15.07.2025..
//
import SwiftUI

struct FavoriteButton: View {
    
    let article: Article

    var body: some View {
        Button {
            FavoritesManager.shared.toggleFavorite(article: article)
        } label: {
            Image(systemName: FavoritesManager.shared.isFavorite(article: article) ? "heart.fill" : "heart")
                .foregroundColor(FavoritesManager.shared.isFavorite(article: article) ? .red : .gray)
        }
    }
}
