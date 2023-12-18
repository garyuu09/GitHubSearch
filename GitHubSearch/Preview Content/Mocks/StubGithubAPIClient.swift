//
//  MockRepoAPIClient.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/10/24.
//

import Foundation

// StubAPIClient
final class StubGitHubAPIClient: GitHubAPIClientInterface {
    var stubbedResponse: RepositoryResponse?
    var stubbedError: Error?

    func searchRepositories(url: URL) async throws -> RepositoryResponse {
        if let error = stubbedError {
            throw error
        }
        return stubbedResponse ?? RepositoryResponse(items: [])
    }
}
