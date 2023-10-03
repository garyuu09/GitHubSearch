//
//  GitHubAPIClient.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import Foundation

protocol GitHubAPIClientInterface {
    func searchRepositories(url: URL) async throws -> RepositoryResponse
}

final class GitHubAPIClient: GitHubAPIClientInterface {

    func searchRepositories(url: URL) async throws -> RepositoryResponse {

        // URLRequestを作成
        var request = URLRequest(url: url)
        request.setValue("Bearer API_KEY", forHTTPHeaderField: "Authorization")

        // URLSessionでRequest
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknownError
        }

        switch httpResponse.statusCode {
        case 200..<300:
            guard let decodedResponse = try?
                    // JsonからSwiftのインスタンスへ変換する。
                    JSONDecoder().decode(RepositoryResponse.self, from: data) else {
                throw APIError.decodeError
            }
            return decodedResponse
        default:
            throw APIError.unknownError
        }
    }
}
