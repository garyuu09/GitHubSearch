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
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchText, onSearch: {
                    Task {
                        try? await viewModel.fetch()
                    }
                })
                .padding(.horizontal, 8)
                List(viewModel.repositories) { repository in
                    NavigationLink(destination: RepositoryDetailView(repository: repository)) {
                        RepositoryRow(repository: repository)
                    }
                }
            }
            .navigationBarTitle("GitHub Repositories")
        }
    }
}

// 検索欄と検索ボタン
struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    @State private var confirmDialogue = false

    var body: some View {
        HStack {
            TextField("Search repositories", text: $text)
                .onSubmit { confirmDialogue = true }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            Button {
                confirmDialogue = true
            } label: {
                Text("Search")
            }
            .padding(.trailing, 16)
        }
        .alert("確認", isPresented: $confirmDialogue) {
            Button("実行") {
                onSearch()
                confirmDialogue = false
            }
        } message: {
            Text("検索を実行しますか。")
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
