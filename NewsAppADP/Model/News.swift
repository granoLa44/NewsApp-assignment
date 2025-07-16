//
//  News.swift
//  NewsAppADP
//
//  Created by Lara on 12.07.2025..
//
import Foundation

struct Article: Codable, Identifiable {
    let id: String
    let title: String
    let summary: String
    let author: String
    let topic: String
    let tags: [String]
    let publishedAt: String
}

struct Articles: Codable {
    let data: [Article]
    let metadata: Metadata
}

struct Metadata: Codable {
    let totalCount: Int
    let page: Int
    let pageSize: Int
}

struct allData: Codable {
    let articles: Articles
}
