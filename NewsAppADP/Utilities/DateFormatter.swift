//
//  DateFormatter.swift
//  NewsAppADP
//
//  Created by Lara on 15.07.2025..
//

import Foundation


func formattedDate(_ publishedAt: String) -> String {
    let iso = ISO8601DateFormatter()
    iso.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

    guard let date = iso.date(from: publishedAt) else { return publishedAt }

    return date.formatted(.dateTime.day().month(.abbreviated).year())
}

