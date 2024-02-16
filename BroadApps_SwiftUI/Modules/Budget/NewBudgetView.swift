//
//  NewBudgetView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI

struct NewBudgetView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: BudgetViewModel
    let type: BudgetType
    let screenTitle: String
    @State var title: String = ""
    @State var date: String = ""
    @State var sum: String = ""
    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 0) {
                Text(screenTitle)
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                    .foregroundColor(.white)

                TextFieldView(type: .default, text: $title, placeholder: "Title")
                Spacer().frame(height: 15)
                HStack(spacing: 15) {
                    DateTextField(text: $date, placeholder: "Date")
                    TextFieldView(type: .numberPad, text: $sum, placeholder: "Sum")
                }
                .padding(.bottom, 102)

                Button(action: {
                    let budget = Budget(type: type, date: date, text: title, sum: sum, id: UUID().uuidString)
                    vm.saveBudget(item: budget)

                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Add")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(20)
                        .background(Color(.appPrimary))
                        .cornerRadius(20)

                })


                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
        }
    }
}

#Preview {
    NewBudgetView(type: .income, screenTitle: "New income")
        .environmentObject(BudgetViewModel())
}

