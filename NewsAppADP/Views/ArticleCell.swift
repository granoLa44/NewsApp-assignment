//
//  ArticleCell.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//

import SwiftUI

struct ArticleCell: View {
    
    let article: Article
    @EnvironmentObject private var favorites: FavoritesListViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(alignment: .top) {
                            Text(article.title)
                                .font(.headline)
                            Spacer()
                            FavoriteButton(article: article)
                        }

                       
                        Text(article.summary)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                        

                        HStack(spacing: 6) {
                            Text(article.topic.uppercased())
                                .padding(.horizontal, 6).padding(.vertical, 3)
                                .background(Capsule().fill(Color.blue.opacity(0.15)))
                            Spacer()
                            Text(formattedDate(article.publishedAt))
                        }
                        .padding(.top, 4)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
    }
}
