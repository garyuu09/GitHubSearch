//
//  SearchError.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/08/30.
//

import Foundation

enum SearchError: Error {
    case noSearchResults

    var title: String {
        switch self {
        case .noSearchResults:
            return "No Search Result"
        }
    }
}
