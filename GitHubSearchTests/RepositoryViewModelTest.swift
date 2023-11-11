//
//  RepositoryViewModelTest.swift
//  GitHubSearchTests
//
//  Created by Ryuga on 2023/09/10.
//

import XCTest
@testable import GitHubSearch


final class RepositoryViewModelTest: XCTestCase {

    private var repositoryViewModel: RepositoryViewModel!
    private var stubRepositoryFetcher: StubRepositoryFetcher!

    @MainActor override func setUp() async throws {
        let mockClient = StubRepositoryFetcher(repositories: mockRepositories)
        let viewModel = RepositoryViewModel(apiClient: mockClient)
    }

    @MainActor private func testRepositoryViewModel_成功してmockリポジトリーを返す() async throws {
        let mockClient = StubRepositoryFetcher(repositories: mockRepositories)
        let viewModel = RepositoryViewModel(apiClient: mockClient)
        try? await viewModel.fetch()
        XCTAssertNotNil(viewModel.repositories)
        XCTAssertEqual("name1", viewModel.repositories[0].name)
    }
}
//    private func testRepositoryViewModel_通信エラーだとnetworkErrorを返す() {
//        repositoryViewModel.
//        XCTAssertNil(stubRepositoryFetcher.returnRepositories)
//        XCTAssertEqual(APIError.networkError, repositoryViewModel.apiError)
//    }
//    private func testRepositoryViewModel_不明なエラーの時はunknownを返す() {
//        mockRepositoryFetcher.fetchResult = .failure(APIError.unknown)
//        testWord = testWords[4]
//        repositoryViewModel.getRepository(word: testWord)
//        XCTAssertNil(mockRepositoryFetcher.returnRepositories)
//        XCTAssertEqual(APIError.unknown, repositoryViewModel.apiError)
//    }
