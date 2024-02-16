//
//  PostRealm.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation
import RealmSwift

class PostRealm: Object {
    @Persisted var title: String
    @Persisted var text: String
    @Persisted var date: Date
    @Persisted(primaryKey: true) var id: String

    convenience init(title: String, text: String, date: Date, id: String) {
        self.init()
        self.title = title
        self.text = text
        self.date = date
        self.id = id
    }
}
