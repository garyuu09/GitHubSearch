//
//  ContentView.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = RepositoryViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                List(viewModel.repositories) { repository in
                    NavigationLink(destination: RepositoryDetailView(repository: repository)) {
                        RepositoryRow(repository: repository)
                    }
                }
            }
            .navigationTitle("GitHub Repositories")
        }
        /// 検索窓と検索実行処理を記載
        .searchable(text: $viewModel.searchText, prompt: "Search repositories")
        .onSubmit(of: .search) {
            Task {
                try? await viewModel.fetch()
            }
        }
        .onChange(of: viewModel.searchText, perform: viewModel.filter)
        .loading(isRefreshing: viewModel.isShowIndicator)

        /// アラート: レポジトリが見つからなかったとき
        .alert("Repository not found", isPresented: $viewModel.isShowAlert) {
            Button("OK") {
                viewModel.isShowAlert = false
            }
        } message: {
            Text("Sorry, repositories were not found. Please try searching with a different keyword.")
        }
    }
}

// 検索結果レコード一覧を表示
struct RepositoryRow: View {
    var repository: Repository

    var body: some View {
        HStack {
            AsyncImage(url: repository.owner.imageURL) { phase in
                if let image = phase.image {
                    image
                        .resizable() // 画像をリサイズしないようにする
                        .aspectRatio(contentMode: .fit) // アスペクト比を保ちつつフレーム内に収める
                } else if phase.error != nil {
                    Text("No image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(.headline)
                Text(repository.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
