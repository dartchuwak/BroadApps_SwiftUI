//
//  NewEventView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 11.02.2024.
//

import SwiftUI

struct NewEventView: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm: EventsViewModel
    @State var team1 = ""
    @State var team2 = ""
    @State var team1Score = ""
    @State var team2Score = ""
    @State var location = ""
    @State var date = ""
    @State var tagSelection = ""

    let tags = ["basketball", "football", "volleyball", "hockey", "box", "golf", "other"]

    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                HStack {
                    TextFieldView(type: .default, text: $team1, placeholder: "Team 01")
                    TextFieldView(type: .numberPad, text: $team1Score, placeholder: "Team 01 scrore")
                }

                HStack {
                    TextFieldView(type: .default, text: $team2, placeholder: "Team 02")
                    TextFieldView(type: .numberPad, text: $team2Score, placeholder: "Team 02 Score")
                }

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tags, id: \.self) { tag in
                            TagView(isSelected: tagSelection == tag, text: tag)
                                .onTapGesture {
                                    self.tagSelection = tag
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.horizontal, -15)

                TextFieldView(type: .default, text: $location, placeholder: "Subtitle")
                DateTextField(text: $date, placeholder: "Date")
                Spacer()

                Button(action: {
                    let event = Event(date: date, location: location, teams: Teams(team1: team1, team2: team2), score: "1:0")
                    vm.saveEvent(event: event)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)

        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }

        })
        .navigationBarBackButtonHidden()
        .navigationTitle("New Event")
        .hiddenTabBar()
    }
}

#Preview {
    NewEventView(vm: EventsViewModel())
}
