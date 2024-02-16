//
//  PostViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import Foundation
import RealmSwift

class PostsViewModel: ObservableObject {

    @Published var posts: [Post] = []

    init() {
        loadPosts()
    }

    func savePost(post: Post) {
        do {
            let realm = try Realm()
            let object = PostRealm(title: post.title, text: post.text, date: post.date, id: post.id)
            try realm.write {
                realm.add(object)
                posts.append(post)
            }
        } catch {
            print( error)
        }
    }

    func deletePost(post: Post) {
        do {
            let realm = try Realm()
            if let object = realm.object(ofType: PostRealm.self, forPrimaryKey: post.id) {
                print(object)
                try realm.write {
                    realm.delete(object)
                }
            } else { print ("No")}
            posts.removeAll(where: {$0.id == post.id})
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadPosts() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in

            }
        )
        Realm.Configuration.defaultConfiguration = config

        do {
            let realm = try Realm()
            let object = realm.objects(PostRealm.self)

            self.posts = object.map {
                Post(title: $0.title, text: $0.text, date: $0.date, id: $0.id)
            }
        } catch {
            print("Posts: \(error)")
        }
    }
}

