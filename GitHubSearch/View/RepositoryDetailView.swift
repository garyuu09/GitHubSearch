//
//  RepositoryDetailView.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/07/03.
//

import SwiftUI

struct RepositoryDetailView: View {
    var repository: Repository

    var body: some View {
        VStack {
            VStack(alignment: .center)  {
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
            }
            .frame(width: 50, height: 50)
            Spacer()
            VStack(alignment: .leading) {
                Text(repository.name)
                    .font(.title)

                Text(repository.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                HStack {
                    Text("Owner:")
                        .font(.headline)
                    Text(repository.owner.login)
                        .font(.subheadline)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle(repository.name)
        }
    }
}

