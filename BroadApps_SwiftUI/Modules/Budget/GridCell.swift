//
//  GridCell.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI

struct GridCell: View {
    @EnvironmentObject var vm: BudgetViewModel

    let item: Budget
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center) {
                Text(item.date)
                    .foregroundColor(.gray)
                    .font(.caption2)
                    .multilineTextAlignment(.leading)
                Spacer()
                Button(action: {
                    vm.removeItem(item: item)
                }, label: {
                    Image(systemName: "trash")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                })
            }
            .padding(.bottom, 8)

            Text(item.text)
                .font(.callout)
                .foregroundColor(.white)
                .padding(.bottom, 20)

            Text(item.type == .income ? "+$\(item.sum)" : "-$\(item.sum)")
                .font(.largeTitle)
                .foregroundColor(item.type == .income ? .green : .red)
        }
        .padding(20)

        .background(Color.white.opacity(0.1))
        .cornerRadius(30)
    }
}

#Preview {
    GridCell(item: Budget(type: .income, date: "23.01.01", text: "Budget", sum: "200", id: UUID()))
        .frame(width: 171)
        .environment(\.colorScheme, .dark)
        .environmentObject(BudgetViewModel())

}
