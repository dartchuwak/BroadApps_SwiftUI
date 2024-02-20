//
//  ResetView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI
import RealmSwift


struct ResetView: View {

    @Binding var isVisible: Bool
    @EnvironmentObject var postVM: PostsViewModel
    @EnvironmentObject var articleVM: ArticlesViewModel
    @EnvironmentObject var budgetVM: BudgetViewModel
    @EnvironmentObject var eventsVM: EventsViewModel

    var body: some View {
        VStack(spacing: 0) {

            Text("Reset Confirmation")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 20)
                .padding(.bottom, 2)
            Text("Your progress will be permanently reset. \nDo you really want to delete all data?")
                .font(.footnote)
                .padding(.bottom, 15)
                .lineLimit(2)
                .foregroundColor(.white)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            Divider()
            Button(action: {
                wipeAllData()
            }, label: {
                Text("Reset")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.appTextSecondary))
            })
            .padding(.vertical, 11)
            Divider()
            Button(action: {
                isVisible.toggle()
            }, label: {
                Text("Cancel")
                    .font(.body)
                    .foregroundColor(Color(.appRed))
            })
            .padding(.vertical ,11)
        }
        .frame(width: 270, height: 183)
        .background(Color(.appGray))
        .cornerRadius(16)
    }

    func wipeAllData() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
            postVM.wipeAll()
            articleVM.wipeAll()
            budgetVM.wipeAll()
            eventsVM.wipeAll()
            isVisible.toggle()
        } catch {
            print("Error: \(error)")
        }
    }
}

#Preview {
    ResetView(isVisible: .constant(true))
}
