//
//  OnboardingView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI
import SwiftUIIntrospect



struct OnboardingView: View {
    @State private var selectedIndex = 0

    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .appPrimary
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(white: 1, alpha: 0.1)
        UIPageControl.appearance().tintColor = .red
    }

    var body: some View {

        let pages = [
            Page(image: "onboard_1", text: "App for the journalists", desctiption: "Add and manage your arcticles"),
            Page(image: "onboard_2", text: "Manage your budget", desctiption: "Add your statistics and earn more"),
            Page(image: "onboard_3", text: "Smart notes", desctiption: "Integrated notes to help you in the events")
        ]

        VStack(spacing: 0) {
            TabView(selection: $selectedIndex) {
                ForEach(0..<pages.count, id: \.self) { index in
                    VStack {
                        Image(pages[index].image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width)
                    }
                    .tag(index)
                    .ignoresSafeArea()
                }
            }
            .ignoresSafeArea()
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))

            Spacer()

            Text(pages[selectedIndex].text)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            Spacer().frame(height: 10)
            Text(pages[selectedIndex].text)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.gray)
            Spacer().frame(height: 30)
            Button(action: {
                withAnimation {
                    selectedIndex = (selectedIndex + 1) % pages.count
                }
            }, label: {
                Text("Next")
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(Color.blue)
                    .cornerRadius(20)

            })
            Spacer().frame(height: 57)
        }
        .background(Color.black)
        .ignoresSafeArea()
    }
}

struct Page {
    let image: String
    let text: String
    let desctiption: String
}


#Preview {
    OnboardingView()
}
