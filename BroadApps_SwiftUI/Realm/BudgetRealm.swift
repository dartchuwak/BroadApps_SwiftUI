//
//  BudgetRealm.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation
import RealmSwift

class BudgetRealm: Object {
    @Persisted var type: String
    @Persisted var date: String
    @Persisted var text: String
    @Persisted var sum: String
    @Persisted(primaryKey: true) var id: String

    convenience init(type: BudgetType, date: String, text: String, sum: String, id: String) {
        self.init()
        self.type = type.rawValue
        self.date = date
        self.text = text
        self.sum = sum
        self.id = id
    }
}
