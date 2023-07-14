//
//  APIError.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError
    case responseError
    case decodeError
    case unknownError

    var title: String {
        switch self {
        case .invalidURL:
            return "Invalid URL Error"
        case .networkError:
            return "Network Error"
        case .responseError:
            return "Response Error"
        case .decodeError:
            return "Decode Error"
        default:
            return "Unknown Error"
        }
    }
}
