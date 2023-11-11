//
//  MockRepoAPIClient.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/10/24.
//

import Foundation

// テスト用Repository
let mockImageURL = URL(string: "")
let mockRepositories: [Repository]
= [Repository(id:1,
              name: "name1",
              owner: Owner(login: "owner1",
                           imageURL: mockImageURL!)),
   Repository(id:2,
              name: "name2",
              owner: Owner(login: "owner2",
                           imageURL: mockImageURL!)),
   Repository(id:3,
              name: "name3",
              owner: Owner(login: "owner3",
                           imageURL: mockImageURL!)),
   Repository(id:4,
              name: "name4",
              owner: Owner(login: "owner4",
                           imageURL: mockImageURL!)),
   Repository(id:5,
              name: "name5",
              owner: Owner(login: "owner5",
                           imageURL: mockImageURL!)),
]
