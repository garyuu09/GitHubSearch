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
    var imageURL: URL

    // Jsonでの名前とSwift上での名前の紐づけを行う。
    enum CodingKeys: String, CodingKey {
        case login
        // 以下の形で対応付けができる。
        // case (上記で宣言したSwift上の変数名) = "(Json上での変数名)"
        case imageURL = "avatar_url"
    }
}

struct RepositoryResponse: Codable {
    var items: [Repository]
}
