//
//  EventDetailsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 11.02.2024.
//

import SwiftUI

struct EventDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var vm: EventsViewModel
    let event: Event
    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text(event.location)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                    Spacer()
                    TagView(isSelected: true, text: event.date)
                }
                VStack {
                    Text(event.score)
                        .font(.system(size: 68))
                        .foregroundColor(.white)
                        .tracking(46)
                        .multilineTextAlignment(.center)

                    HStack {
                        Text(event.teams.team1)
                            .font(.body)
                            .foregroundColor(.white)
                        Spacer().frame(maxWidth: 92)
                        Text(event.teams.team2)
                            .font(.body)
                            .foregroundColor(.white)
                    }
                }

                Spacer()

            }
            .padding(.horizontal)

        }
        .hiddenTabBar()
        .navigationTitle(Text("\(event.teams.team1) VS \(event.teams.team2)"))
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    vm.delete(item: event)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "trash")
                })
            }
        })
    }
}

#Preview {
    EventDetailsView(event: Event(date: "23.16.2021", location: "Sky Arena, Denver", teams: Teams(team1: "Febers", team2: "Toronto"), score: "1:0"))
        .environmentObject(EventsViewModel())
}
