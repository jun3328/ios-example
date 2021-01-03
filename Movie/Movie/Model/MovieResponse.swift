//
//  MovieResponse.swift
//  Movie
//
//  Created by lee on 2021/01/25.
//

import Foundation

// MARK: - Welcome
struct MovieResponse: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Movie]
}

// MARK: - Item
struct Movie: Codable {
    let title: String
    let link: String
    let image: String
    let subtitle, pubDate, director, actor: String
    let userRating: String
}

