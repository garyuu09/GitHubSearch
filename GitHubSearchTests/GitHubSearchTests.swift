//
//  GitHubSearchTests.swift
//  GitHubSearchTests
//
//  Created by Ryuga on 2023/07/02.
//

import XCTest
@testable import GitHubSearch

class GitHubAPIClientTests: XCTestCase {
    var stubAPIClient: StubGitHubAPIClient!

    override func setUp() {
        super.setUp()
        stubAPIClient = StubGitHubAPIClient()
    }

    override func tearDown() {
        stubAPIClient = nil
        super.tearDown()
    }

    func testSearchRepositoriesSuccess() async throws {
        // スタブに成功レスポンスを設定
        stubAPIClient.stubbedResponse = RepositoryResponse(items: mockRepositories)

        let response = try await stubAPIClient.searchRepositories(url: URL(string: "https://example.com")!)

        // 成功レスポンスが得られたことを確認
        XCTAssertEqual(response.items.count, 6)
        XCTAssertEqual(response.items[0].id, 1)
        XCTAssertEqual(response.items[0].name, "TestRepo_1")
        XCTAssertEqual(response.items[0].description, "A test repository 1")
        XCTAssertEqual(response.items[0].owner.login, "TestUser_1")
        XCTAssertEqual(response.items[0].owner.imageURL, URL(string: "https://example.com/image1.png")!)
    }

    func testSearchRepositoriesFailure() async throws {
        // スタブにエラーを設定
        stubAPIClient.stubbedError = APIError.responseError

        do {
            _ = try await stubAPIClient.searchRepositories(url: URL(string: "https://example.com")!)
            XCTFail("エラーが発生することを期待していましたが、発生しませんでした")
        } catch {
            // エラーが発生したことを確認
            XCTAssertNotNil(error)
        }
    }
}
