//
//  ArticlesViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import Foundation
import SwiftUI

final class ArticlesViewModel: ObservableObject {

    @Published var articles: [Article] = []

    func delete(item: Article) {
        articles.removeAll(where: {$0.id == item.id})
    }


    func saveNewArticle(article: Article) {
        self.articles.append(article)
    }
}

struct Article: Hashable {
    let headline: String
    let tag: String
    let status: Status
    let publisher: String
    let text: String
    let id = UUID()
}
