# GitHubSearch App

GitHubSearch Appは、任意のキーワードを入力することでGitHubレポジトリを検索するためのiOSアプリケーションです。

## スクリーンショット
|ホーム|レポジトリ一覧|レポジトリ詳細|
|:--:|:--:|:--:|
|<img src="./Docs/ScreenShots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%20HomeView.png" width="207">|<img src="./Docs/ScreenShots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%20Repository Items.png" width="207">|<img src="./Docs/ScreenShots/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%20RepositoryDetailView.png" width="207">|

## 特徴

- 何かしらのキーワードを入力
- GitHub API（search/repositories）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
- 特定の結果を選択したら、該当リポジトリの詳細を表示

## 動作環境

- iOS 12.0以降
- iPhoneおよびiPadに対応
- ダークモード対応
- 日本語/英語の２カ国に対応

## 開発環境
- IDE：Xcode 15.0.1 (15A507)
- Swift：Swift 5.9
- Deployment Target：iOS 17.1

## 使用技術
- SwiftUI
- Swift Concurrency
- MVVM

## インストール方法

1. リポジトリをクローンします
   ```zsh
   git clone https://github.com/garyuu09/GitHubSearch.git
   cd GitHubSearch
   ```

## 貢献
貢献をお待ちしています。

- [新しいイシュー](https://github.com/garyuu09/GitHubSearch/issues/new)
- [新しいプルリクエスト](https://github.com/garyuu09/GitHubSearch/compare)



