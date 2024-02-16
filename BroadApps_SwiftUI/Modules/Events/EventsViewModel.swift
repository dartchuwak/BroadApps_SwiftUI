//
//  EventsViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI
import RealmSwift

protocol EventsViewModelProtocol: ObservableObject {
    var events: [Event] { get }
    func saveEvent(event: Event)
}


final class EventsViewModel: ObservableObject, EventsViewModelProtocol {
    @Published var events: [Event] = []

    init() {
        loadEvents()
    }

    func saveEvent(event: Event) {
        let realmEvent = EventRealm(date: event.date, location: event.location, teams: event.teams, score: event.score, id: event.id)

              do {
                  let realm = try Realm()
                  try realm.write {
                      realm.add(realmEvent)
                  }
              } catch {
                  print(error)
              }

        events.append(event)
    }

    func delete(item: Event) {
        do {
            let realm = try Realm()
            if let object = realm.object(ofType: EventRealm.self, forPrimaryKey: item.id) {
                try realm.write {
                    realm.delete(object)
                }
                events.removeAll(where: {$0.id == item.id})
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadEvents() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in

            }
        )
        Realm.Configuration.defaultConfiguration = config
        
        do {
                 let realm = try Realm()
                 let object = realm.objects(EventRealm.self)


            self.events = object.map { Event(date: $0.date, location: $0.location, teams: Teams(team1: $0.team1, team2: $0.team2), score: $0.score, id: $0.id) }
             } catch {
                 print("Event: \(error)")
             }
    }

}
