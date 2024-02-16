//
//  Event.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation

struct Event: Hashable {
    let date: String
    let location: String
    let teams: Teams
    let score: String
    let id: String
}

struct Teams: Hashable {
    let team1 : String
    let team2 : String
}

