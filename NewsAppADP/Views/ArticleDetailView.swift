//
//  ArticleDetailView.swift
//  NewsAppADP
//
//  Created by Lara on 14.07.2025..
//
import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    @EnvironmentObject private var favoritesVM: FavoritesListViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Text(article.title)
                    .font(.title.bold())
                    .multilineTextAlignment(.leading)

                HStack(spacing: 6) {
                    Text(article.topic.uppercased())
                        .padding(.horizontal, 6).padding(.vertical, 3)
                        .background(Capsule().fill(Color.blue.opacity(0.15)))
                }
                .font(.caption)
                .foregroundColor(.secondary)

                Text(article.summary)
                    .font(.body)
                    .padding(.vertical, 2)
                
                HStack(spacing: 6) {
                    Text(formattedDate(article.publishedAt))
                    Text("-")
                    Text(article.author)
                }
                .font(.caption)
                .foregroundColor(.secondary)

                HStack {
                    ForEach(article.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption2)
                            .padding(.horizontal, 6).padding(.vertical, 3)
                            .background(Capsule().fill(Color.gray.opacity(0.2)))
                    }
                }
                .padding(.top, 6)
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .toolbar {
            FavoriteButton(article: article)
        }
    }
}
