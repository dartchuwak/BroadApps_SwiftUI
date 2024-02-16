//
//  SettingsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @State var isRateVisible: Bool = false
    @State var isResetVisible: Bool = false

    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .foregroundColor(.white)


                    Spacer()
                }

                SettingsCell(isReset: false, image: "square.and.arrow.up.fill", title: "Share app")
                SettingsCell(isReset: false, image: "star.fill", title: "Rate app")
                    .onTapGesture {
                        rateApp()
                    }
                SettingsCell(isReset: false, image: "doc.text.fill", title: "Usage profile")
                SettingsCell(isReset: true, image: "arrow.triangle.2.circlepath", title: "Reset progress")
                    .onTapGesture {
                        isResetVisible.toggle()
                    }
                Spacer()



            }
            .disabled(isRateVisible || isResetVisible ? true : false)
            .padding(.horizontal)

            if isRateVisible || isResetVisible {
                Color.black.opacity(0.25)

            }

            if isResetVisible {
                ResetView(isVisible: $isResetVisible)
            }
        }
    }

    func rateApp() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }

    }
}

#Preview {
    SettingsView()
}
