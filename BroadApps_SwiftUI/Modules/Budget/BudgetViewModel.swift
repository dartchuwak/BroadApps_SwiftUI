//
//  BudgetViewModel.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import Foundation

final class BudgetViewModel: ObservableObject {
    
    @Published var income: [Budget] = [
        
    ]
    @Published var expences: [Budget] = [

    ]
    
    func removeItem(item: Budget) {
        income.removeAll(where: {$0.id == item.id})
        expences.removeAll(where: {$0.id == item.id})
    }
    
    func saveBudget(item: Budget) {
        if item.type == .income {
            income.append(item)
        }
        
        if item.type == .expense {
            expences.append(item)
        }
    }
}

struct Budget: Hashable {
    var type: BudgetType
    var date: String
    var text: String
    var sum: String
    var id = UUID()
}
