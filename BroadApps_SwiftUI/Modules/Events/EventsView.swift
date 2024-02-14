//
//  EventsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct EventsView: View {
    
    @State var isShowingNewEventView: Bool = false
    
    @EnvironmentObject var vm: EventsViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Color(.appBlack)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Events")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)
                    if vm.events.isEmpty {
                        VStack(spacing: 10) {
                            Text("No events added")
                                .foregroundColor(.white)
                                .font(.title)
                            Text("Add an event with the plus icon above")
                                .foregroundColor(.appTabBar)
                                .font(.body)
                        }
                        .padding(.top, 200)
                    } else {
                        ScrollView {
                            ForEach(vm.events, id: \.self) { event in
                                NavigationLink {
                                    EventDetailsView(event: event)
                                } label: {
                                    EventsViewCell(event: event)
                                }
                            }
                        }
                    }
                    Spacer()
                }


                NavigationLink(destination: NewEventView(vm: vm), isActive: $isShowingNewEventView) {
                    EmptyView()
                }
            }
            .showTabBar()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingNewEventView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(.appPrimary))
                    })
                    
                }
            }
        }

    }
}

#Preview {
    EventsView()
        .environmentObject(EventsViewModel())
}
