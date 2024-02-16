//
//  ArticleRealm.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation
import RealmSwift

class ArticleRealm: Object {
    @Persisted var headline: String
    @Persisted var publisher: String
    @Persisted var text: String
    @Persisted var status: String
    @Persisted var tag: String
    @Persisted(primaryKey: true) var id: String

    convenience init(headline: String, publisher: String, text: String, status: Status, tag: String, id: String) {
        self.init()
        self.headline = headline
        self.publisher = publisher
        self.text = text
        self.status = status.rawValue
        self.tag = tag
        self.id = id
    }
}
