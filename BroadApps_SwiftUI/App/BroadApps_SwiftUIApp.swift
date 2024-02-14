//
//  BroadApps_SwiftUIApp.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

@main
struct BroadApps_SwiftUIApp: App {

    @StateObject var budgetViewModel: BudgetViewModel = BudgetViewModel()
    @StateObject var postsViewModel: PostsViewModel = PostsViewModel()
    @StateObject var articlesViewModel = ArticlesViewModel()
    @StateObject var eventsViewModel = EventsViewModel()
    @AppStorage("isOnboardingViewed") var isOnboardingViewed: Bool = false
    @State var progress: CGFloat = 0.0
    @State var isLoaded = false
    let time: DispatchTime = .now() + 2

    var body: some Scene {
        WindowGroup {
            if isLoaded {
                if isOnboardingViewed {
                    MainTabVew()
                        .environmentObject(budgetViewModel)
                        .environmentObject(postsViewModel)
                        .environmentObject(eventsViewModel)
                        .environmentObject(articlesViewModel)
                } else {
                    OnboardingView(isViewed: $isOnboardingViewed)
                        .ignoresSafeArea()
                }
            } else {
                LoadingScreen(progress: $progress)
                    .onAppear {
                        withAnimation(.linear(duration: 2)) {
                            progress = 1.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: time) {
                            isLoaded.toggle()
                        }
                    }
            }
        }
    }
}
