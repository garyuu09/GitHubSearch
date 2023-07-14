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

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void

    var body: some View {
        HStack {
            TextField("Search repositories", text: $text)
                .onSubmit { onSearch() }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 16)
            Button(action: onSearch) {
                Text("Search")
            }
            .padding(.trailing, 16)
        }
    }
}

struct RepositoryRow: View {
    var repository: Repository

    var body: some View {
        VStack(alignment: .leading) {
            Text(repository.name)
                .font(.headline)
            Text(repository.description ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
