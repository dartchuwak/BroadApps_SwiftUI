//
//  EventsViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

protocol EventsViewModelProtocol: ObservableObject {
    var events: [Event] { get }
    func saveEvent(event: Event)
}


final class EventsViewModel: ObservableObject, EventsViewModelProtocol {
    @Published var events: [Event] = []

    func saveEvent(event: Event) {
        events.append(event)
    }

    func delete(item: Event) {
        events.removeAll(where: {$0.id == item.id})
    }

}

struct Event: Hashable {
    let date: String
    let location: String
    let teams: Teams
    let score: String
    let id = UUID()
}

struct Teams: Hashable {
    let team1 : String
    let team2 : String
}
