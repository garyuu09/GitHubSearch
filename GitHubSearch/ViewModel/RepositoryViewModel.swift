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
    private var apiClient = GithubAPIClient()

    func fetch() async throws {
        do {
            repositories = try await apiClient.searchRepositories(url:
            APIurl.githubURLString(searchText: searchText)
            ).items
        } catch {
            throw APIError.decodeError
        }
    }
}
