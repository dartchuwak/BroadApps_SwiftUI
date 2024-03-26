//
//  BudgetViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import Foundation
import RealmSwift

final class BudgetViewModel: ObservableObject {

    @Published var income: [Budget] = []
    @Published var expences: [Budget] = []


    init() {
        loadBudgets()
    }

    func removeItem(item: Budget) {
        income.removeAll(where: {$0.id == item.id})
        expences.removeAll(where: {$0.id == item.id})

        do {
            let realm = try Realm()
            if let object = realm.object(ofType: BudgetRealm.self, forPrimaryKey: item.id) {
                try realm.write {
                    realm.delete(object)
                }

            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func wipeAll() {
        income.removeAll()
        expences.removeAll()
    }

    func saveBudget(item: Budget) {

        if item.type == .income {
            income.append(item)
        }

        if item.type == .expense {
            expences.append(item)
        }

        let object = BudgetRealm(type: item.type, date: item.date, text: item.text, sum: item.sum, id: item.id)

        do {
            let realm = try Realm()
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error.localizedDescription)
        }
    }

    func loadBudgets() {
        let config = Realm.Configuration(
            schemaVersion: 2,
            migrationBlock: { migration, oldSchemaVersion in

            }
        )
        Realm.Configuration.defaultConfiguration = config

        do {
            let realm = try Realm()
            let object = realm.objects(BudgetRealm.self)


            let budgets = object.map {
                Budget(type: BudgetType(rawValue: $0.type) ?? .income, date: $0.date, text: $0.text, sum: $0.sum, id: $0.id)
            }

            budgets.forEach { budget in
                if budget.type == .expense {
                    self.expences.append(budget)
                }

                if budget.type == .income {
                    self.income.append(budget)
                }
            }
        } catch {
            print("Budget: \(error)")
        }
    }
}
