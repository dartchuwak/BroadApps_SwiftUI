//
//  BudgetView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct BudgetView: View {

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "app.primary")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }

    @State var showIncomeView = false
    @State var isMenuShown = false
    @State var selection: BudgetType = .income
    @EnvironmentObject var vm: BudgetViewModel

    var body: some View {
        NavigationView {
            ZStack(alignment: .topTrailing) {
                Color(.appBlack)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Budget")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    Picker("Selection", selection: $selection) {
                        Text("Income").tag(BudgetType.income)
                        Text("Expenses").tag(BudgetType.expense)
                    }

                    .pickerStyle(.segmented)

                    ScrollView {
                        let width = (UIScreen.main.bounds.width - 30 - 8) / 2
                        let columns = [GridItem(.fixed(width)), GridItem(.fixed(width))]
                        if selection == .income {
                            if vm.income.isEmpty {
                                VStack(spacing: 10) {
                                    Text("No incomes added")
                                        .foregroundColor(.white)
                                        .font(.title)
                                    Text("Add an income with the plus icon above")
                                        .font(.body)
                                        .foregroundColor(.gray)
                                }
                                .padding(.top, 160)
                            } else {
                                LazyVGrid(columns: columns, spacing: 8) {
                                    ForEach(vm.income, id:\.self) { item in
                                        GridCell(item: item)
                                    }
                                }
                            }
                        } else {
                            if vm.expences.isEmpty {
                                VStack(spacing: 10) {
                                    Text("No expenses added")
                                        .foregroundColor(.white)
                                        .font(.title)
                                    Text("Add an expense with the plus icon above")
                                        .font(.body)
                                        .foregroundColor(.gray)
                                }
                                .padding(.top, 160)
                            } else {
                                LazyVGrid(columns: columns) {
                                    ForEach(vm.expences, id:\.self) { item in
                                        GridCell(item: item)
                                    }
                                }
                            }
                        }
                    }
                    .background(Color.clear)
                    .ignoresSafeArea(.all, edges: .bottom)


                    NavigationLink(isActive: $showIncomeView) {
                        NewBudgetView(type: selection , screenTitle: selection.rawValue)
                    } label: {
                        EmptyView()
                    }



                }
                .padding(.horizontal)

                if isMenuShown {
                    PopOverView(selection: $selection, showNewView: $showIncomeView)
                        .ignoresSafeArea(.all, edges: .top)
                }

            }
            .onAppear {
                isMenuShown = false
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {

                    Button(action: {
                        withAnimation {
                            isMenuShown.toggle()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
    }
}

enum Selection: String,CaseIterable, Identifiable, Equatable {
    var id: Self { self }
    case income
    case expenses
}

#Preview {
    BudgetView()
        .environmentObject(BudgetViewModel())
}

struct PopOverView: View {
    @Binding var selection: BudgetType
    @Binding var showNewView: Bool
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                selection = .income
                showNewView.toggle()
            }, label: {
                HStack {
                    Image(systemName: "arrow.up")
                        .foregroundColor(.green)
                    Text("New income")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 15)
            })

            Divider()
            Button(action: {
                selection = .expense
                showNewView.toggle()
            }, label: {
                HStack {
                    Image(systemName: "arrow.down")
                        .foregroundColor(.red)
                    Text("New expense")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 15)
            })
        }
        .frame(width: 171, height: 82)
        .background(Color(.appCardbg))
        .cornerRadius(12)
        .padding(.trailing, 20)
        .padding(.top, 103)
    }
}

