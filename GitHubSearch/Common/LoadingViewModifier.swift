//
//  LoadingViewModifier.swift
//  GitHubSearch
//
//  Created by Ryuga on 2023/09/05.
//

import SwiftUI

/// ローディング画面を出すViewModifier
struct LoadingViewModifier: ViewModifier {
    var isRefreshing: Bool

    func body(content: Content) -> some View {
        ZStack {
            content

            if isRefreshing {
                ProgressView {
                    Text("Loading...")
                }
                .padding()
                .tint(.primary)
                .background(.secondary)
                .cornerRadius(8)
            }
        }
    }
}

extension View {
    /// 通信中にProgressViewを表示
    /// - Parameters:
    ///   - isRefreshing: 通信中か否か
    /// - Returns: ローディング画面
    func loading(isRefreshing: Bool, safeAreaEdges: Edge.Set = []) -> some View {
        modifier(LoadingViewModifier(isRefreshing: isRefreshing))
    }
}

