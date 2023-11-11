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
    @Published var isShowAlert: Bool = false
    @Published var isShowIndicator: Bool = false

    // テスト用のイニシャライザ
    private let apiClient: GitHubAPIClientInterface

    convenience init() {
        self.init(apiClient: GitHubAPIClient())
    }
    // Dependency Injection
    init(apiClient: GitHubAPIClientInterface) {
        self.apiClient = apiClient
    }

    func fetch() async throws {
        Task {
            isShowIndicator = true
            defer {
                isShowIndicator = false
            }
            // 非同期タスクで0.5秒間スリープする。
            try? await Task.sleep(nanoseconds: 500_000_000)

            do {
                repositories = try await apiClient.searchRepositories(
                url: APIurl.githubURLString(searchText: searchText)
                ).items
            }
            catch {
                throw APIError.decodeError
            }
            // 検索結果が0件の場合にアラートダイアログを表示する。
            if repositories.isEmpty {
                self.isShowAlert = true
                throw SearchError.noSearchResults
            }
        }
    }
}
