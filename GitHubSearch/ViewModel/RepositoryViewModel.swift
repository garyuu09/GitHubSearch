//
//  RepositoryViewModel.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import SwiftUI

@MainActor
class RepositoryViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var searchText: String = ""
    @Published var showAlert: Bool = false
    private var apiClient = GithubAPIClient()

    func fetch() async throws {
        do {
            repositories = try await apiClient.searchRepositories(url:
            APIurl.githubURLString(searchText: searchText)
            ).items
            // 検索結果が0件の場合にアラートダイアログを表示する。
            if repositories.isEmpty {
                self.showAlert = true
                throw SearchError.noSearchResults
            }
        }
        catch {
            throw APIError.decodeError
        }
    }
}
