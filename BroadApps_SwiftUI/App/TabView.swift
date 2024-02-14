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
        }
    }
}

#Preview {
    MainTabVew()
}
