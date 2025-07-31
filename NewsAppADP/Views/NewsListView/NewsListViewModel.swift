//
//  NewsListViewModel.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//

import Foundation

@MainActor
final class NewsListViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    
    init() {
        getArticles()
    }

    func getArticles() {
        isLoading = true
        
        Task {
            do {
                articles.append(contentsOf: try await NetworkManager.shared.getArticlesData())
                isLoading = false
            } catch {
                if let apiError = error as? APIError {
                    switch apiError {
                        case .invalidURL:
                            print("Invalid URL")
                        case .invalidResponse:
                            print("Invalid Response")
                        case .invalidDecoding:
                            print("Invalid decoding")
                    }
                } else {
                    print("Something went wrong")
                }
            }
        }

    }
    
    func loadMore() {
        if (NetworkManager.shared.hasNextPage()) {
            getArticles()
        }
    }
    
    func refresh() {
        articles.removeAll()
        NetworkManager.shared.resetPageNumber()
        getArticles()
    }
    
    func sortByDate(ascending: Bool = false) {
        if ascending {
            articles.sort { $0.publishedAt < $1.publishedAt }
        } else {
            articles.sort { $0.publishedAt > $1.publishedAt }
        }
        
    }
    
}
