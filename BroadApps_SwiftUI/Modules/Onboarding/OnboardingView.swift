//
//  OnboardingView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI



struct OnboardingView: View {
    @State private var selectedIndex = 0
    @Binding var isViewed: Bool

    let pages = [
        Page(image: "onboard_1", text: "App for the journalists", desctiption: "Add and manage your arcticles"),
        Page(image: "onboard_2", text: "Manage your budget", desctiption: "Add your statistics and earn more"),
        Page(image: "onboard_3", text: "Smart notes", desctiption: "Integrated notes to help you in the events")
    ]

    var body: some View {

        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {
                TabView(selection: $selectedIndex) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        VStack {
                            Image(pages[index].image)
                                .resizable()
                                .frame(width: 393, height: 575)
                                .ignoresSafeArea()
                            Spacer()
                        }
                        .tag(index)

                    }
                }
                .frame(width: 393, height: 575)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .padding(.bottom, 10)

                PageIndicator(numberOfPages: pages.count, currentIndex: selectedIndex)
                    .padding(.top, 8)
                    .padding(.bottom, 17)


                Text(pages[selectedIndex].text)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer().frame(height: 10)
                Text(pages[selectedIndex].desctiption)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                Spacer().frame(height: 32)
                Button(action: {
                    withAnimation {
                        if selectedIndex < pages.count - 1 {
                            selectedIndex += 1
                        } else {
                            isViewed = true
                        }
                    }
                }) {
                    HStack {
                        Spacer()
                        Text("Next")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.vertical, 20)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding(.horizontal)
                }


                Spacer().frame(height: 47)
            }
            .ignoresSafeArea()
        }

    }
}

struct PageIndicator: View {
    var numberOfPages: Int
    var currentIndex: Int
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.blue : Color.white.opacity(0.1))
                    .frame(width: 8, height: 8)
            }
        }
    }
}


struct Page {
    let image: String
    let text: String
    let desctiption: String
}


#Preview {
    OnboardingView(isViewed: .constant(false))
}
