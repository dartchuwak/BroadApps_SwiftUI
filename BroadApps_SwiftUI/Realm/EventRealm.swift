//
//  EventRealm.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation
import RealmSwift


class EventRealm: Object {
    @Persisted var date: String
    @Persisted var location: String
    @Persisted var team1: String
    @Persisted var team2: String
    @Persisted var score: String
    @Persisted(primaryKey: true) var id: String

    convenience init(date: String, location: String, teams: Teams, score: String, id: String) {
        self.init()
        self.date = date
        self.location = location
        self.team1 = teams.team1
        self.team2 = teams.team2
        self.score = score
        self.id = id
    }
}
