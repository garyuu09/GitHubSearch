//
//  RepositoryModel.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import Foundation

struct Repository: Codable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var owner: Owner
}

struct Owner: Codable {
    var login: String
}

struct RepositoryResponse: Codable {
    var items: [Repository]
}
