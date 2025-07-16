//
//  FavoriteButton.swift
//  NewsAppADP
//
//  Created by Lara on 15.07.2025..
//
import SwiftUI

struct FavoriteButton: View {
    
    let article: Article

    @EnvironmentObject private var favoritesVM: FavoritesListViewModel

    var body: some View {
        Button {
            favoritesVM.toggleFavorite(article: article)
        } label: {
            Image(systemName: favoritesVM.isFavorite(article: article) ? "heart.fill" : "heart")
                .foregroundColor(favoritesVM.isFavorite(article: article) ? .red : .gray)
        }
    }
}
