//
//  RateView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI

struct RateView: View {

    @Binding var isVisible: Bool
    var body: some View {
        VStack {
            Image("")
                .frame(width: 60, height: 60)
            Text("Review app?")
                .foregroundColor(.white)
                .font(.headline)
            Text("Tap a star to rate it on the \nApp Store.")
                .foregroundColor(.white)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            Divider()
            HStack {
                ForEach(0..<5) {_ in
                    Image(systemName: "star")
                        .foregroundColor(Color(.appPrimary))
                }
            }
            .padding(.vertical, 12)
            Divider()
            Button(action: {
                isVisible.toggle()
            }, label: {
            Text("Not now")
                    .foregroundColor(Color(.appRed))
            })
            .padding(.vertical ,11)
        }
        .frame(width: 269, height: 245)
        .background(Color(.appCardbg))
        .cornerRadius(16)
    }
}

#Preview {
    RateView(isVisible: .constant(true))
}
