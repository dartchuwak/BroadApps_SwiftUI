//
//  ArticlesViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import Foundation
import SwiftUI
import RealmSwift

final class ArticlesViewModel: ObservableObject {

    @Published var articles: [Article] = []

    init() {
        loadArticles()
    }

    func delete(item: Article) {
        do {
            let realm = try Realm()
            if let object = realm.object(ofType: ArticleRealm.self, forPrimaryKey: item.id) {
                try realm.write {
                    realm.delete(object)
                }
                articles.removeAll(where: {$0.id == item.id})
            }
        } catch {
            print(error.localizedDescription)
        }

    }
    func wipeAll() {
        articles.removeAll()
    }


    func saveNewArticle(article: Article) {

        let realmArticle = ArticleRealm(headline: article.headline, publisher: article.publisher, text: article.text, status: article.status, tag: article.tag, id: article.id)


        do {
            let realm = try Realm()
            try realm.write {
                realm.add(realmArticle)
            }
        } catch {
            print(error)
        }

        self.articles.append(article)
    }

    func loadArticles() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in

            }
        )
        Realm.Configuration.defaultConfiguration = config
        
        do {
            let realm = try Realm()
            let realmArticles = realm.objects(ArticleRealm.self)


            self.articles = realmArticles.map { Article(headline: $0.headline, tag: $0.tag, status: Status(rawValue: $0.status) ?? .none, publisher: $0.publisher, text: $0.text, id: $0.id) }
        } catch {
            print("Articles: \(error)")
        }
    }
}
