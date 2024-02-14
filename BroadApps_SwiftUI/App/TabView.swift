//
//  TabView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct MainTabVew: View {
    var body: some View {
        TabView {
            ArticlesView()
                .tabItem {
                    Label("Articles", systemImage: "doc.fill")
                }

            EventsView()
                .tabItem {
                    Label("Events", systemImage: "trophy.fill")
                }

            BudgetView()
                .tabItem {
                    Label("Budget", systemImage: "dollarsign.circle.fill")
                }

            PostsView()
                .tabItem {
                    Label("Posts", systemImage: "doc.richtext.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(.appTabBar)
            UITabBar.appearance().backgroundColor = UIColor(.appTab)
        }
    }
}

#Preview {
    MainTabVew()
}
