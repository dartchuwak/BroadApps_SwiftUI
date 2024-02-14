//
//  ArticlesViewCell.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct EventsViewCell: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TagView(isSelected: true, text: event.date)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(event.location)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
            }
            Text("\(event.teams.team1) VS \(event.teams.team2)")
                .foregroundColor(.white)
                .font(.system(size: 22))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color(.appPrimary).opacity(0.15))
        .cornerRadius(30)
    }
}

#Preview {
    EventsViewCell(event: Event(date: "23.01.2023", location: "Sky Arena, Denver", teams: Teams(team1: "Eves", team2: "Toronto"), score: "1:0"))
}
