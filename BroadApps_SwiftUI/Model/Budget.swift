//
//  Budget.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation

struct Budget: Hashable {
    var type: BudgetType
    var date: String
    var text: String
    var sum: String
    var id: String
}

enum BudgetType: String,CaseIterable, Identifiable, Equatable {
    var id: Self { self }
    case income = "New income"
    case expense = "New expense"
}
