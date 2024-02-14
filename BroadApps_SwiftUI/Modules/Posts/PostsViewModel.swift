//
//  PostViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import Foundation

class PostsViewModel: ObservableObject {

    @Published var posts: [Post] = []

    func savePost(post: Post) {
        posts.append(post)
    }
}


struct Post: Hashable {
    let title: String
    let text: String
    let date: Date
}
