//
//  NewListView.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//

import SwiftUI

struct NewsListView: View {
    
    @EnvironmentObject private var viewModel: NewsListViewModel
    @EnvironmentObject private var favoritesVM: FavoritesListViewModel
    
    @State private var searchText: String = ""
    
    var filteredArticles: [Article] {
        searchText.isEmpty
        ? viewModel.articles
        : viewModel.articles.filter {
            $0.title.lowercased().contains(searchText.lowercased()) || $0.summary.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                if viewModel.isLoading {LoadingView()}
                
                
                LazyVStack() {
                    ForEach(filteredArticles, id: \.id) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)){
                            ArticleCell(article: article)}.buttonStyle(PlainButtonStyle())
                    }
                }
                .scrollTargetLayout()
                .searchable(text: $searchText)
            }
            .onScrollTargetVisibilityChange(idType: Article.ID.self, threshold: 0.3) {visibleIds in
                if let lastVisible = viewModel.articles.last,
                   visibleIds.contains(where: {$0 == lastVisible.id}){
                    viewModel.loadMore()
                }
            }
            .refreshable {viewModel.resfresh()}
            .navigationTitle("News")
            .toolbar {
                Menu {
                    Button("by date ascending") {
                        viewModel.sortByDate(ascending: true)
                    }
                    Button("by date descending") {
                        viewModel.sortByDate(ascending: false)
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        }
    }
}

#Preview {
    NewsListView()
}
