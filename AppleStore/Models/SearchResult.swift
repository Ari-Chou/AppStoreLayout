//
//  SearchResults.swift
//  AppleStore
//
//  Created by AriChou on 4/3/21.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String //App Icon
    let screenshotUrls: [String]
}
