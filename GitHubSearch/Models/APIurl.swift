//
//  APIurl.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import Foundation

/// 受け取った検索キーワード(`searchText`)を使ってURLを作成する。
struct APIurl {
    static func githubURLString(searchText: String) throws -> URL {
        let urlString = "https://api.github.com/search/repositories?q=\(searchText)"
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        return url
    }
}
