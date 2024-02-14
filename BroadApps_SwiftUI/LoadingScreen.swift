//
//  LoadingScreen.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct LoadingScreen: View {
    @Binding var progress: CGFloat
    var body: some View {
        ZStack {
            Color("app.black")
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 190, height: 190)
                Spacer()
                ProgressView(progress: $progress)
                Spacer()
                    .frame(height: 120)
            }
        }
    }
}

struct ProgressView: View {

    @Binding var progress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(width: 190, height: 6)
                .foregroundColor(.white.opacity(0.1))

            Rectangle()
                .frame(width: progress * 190, height: 6)
                .foregroundColor(Color(.appPrimary))
        }
        .mask( Rectangle()
            .frame(width: 190, height: 6)
            .cornerRadius(3))
    }
}

#Preview {
    LoadingScreen(progress: .constant(0.5))
}


