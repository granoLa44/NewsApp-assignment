//
//  NetworkManager.swift
//  NewsAppADP
//
//  Created by Lara on 13.07.2025..
//
import SwiftUI

final class NetworkManager {
    
    static let shared = NetworkManager()
    private var session: URLSession!
    
    var currentPage: Int  = 1
    private var currentCount: Int = 0
    private var totalCount: Int = 0
    
    @State private var isLoading = false
    
    let configuration = URLSessionConfiguration.default
    
    func getArticlesData() async throws -> [Article] {
        isLoading = true
        
        let urlString = "http://localhost:3000/api/articles?page=\(currentPage)"
        let token = "" //insert token
        
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        configuration.httpAdditionalHeaders?["Authorization"] = "Bearer \(token)"
        session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let articles = try decoder.decode(allData.self, from: data)
            self.totalCount = articles.articles.metadata.totalCount
            self.currentCount += articles.articles.metadata.pageSize
            return articles.articles.data
            
        } catch {
            print(error)
            throw APIError.invalidDecoding
        }
    }
    
    func hasNextPage() -> Bool {
        guard currentCount < totalCount else {
            return false
        }
        currentPage += 1
        return true
    }
    
    func resetPageNumber() {
        currentPage = 1
        currentCount = 0
    }
}


