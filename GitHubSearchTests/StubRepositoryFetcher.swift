//
//  StubRepositoryFetcher.swift
//  GitHubSearchTests
//
//  Created by Ryuga on 2023/10/24.
//

import Foundation
@testable import GitHubSearch

class StubRepositoryFetcher: GitHubAPIClientInterface {
    // メソッドの結果を操作するプロパティ
    var statusCode: Int?
    // 呼び出された引数を記録するプロパティ
    var url: URL?
    // 返り値を記録するプロパティ
    var returnRepositories: [Repository]?

    var searchRepositoriesResult: Result<RepositoryResponse, Error>?

    // コンストラクタでテスト用のデータを受け取る
    init(repositories: [Repository]) {
        self.returnRepositories = repositories
    }

    func searchRepositories(url: URL) async throws -> GitHubSearch.RepositoryResponse {
        if let result = searchRepositoriesResult {
            switch result {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            }
        } else {
            throw APIError.unknownError // スタブが設定されていない場合はエラーをスロー
        }
    }
}
