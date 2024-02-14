//
//  SettingsCell.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI

struct SettingsCell: View {
    let isReset: Bool
    let image: String
    let title: String
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image(systemName: image)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }

            HStack {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding(20)
        .background(isReset ? Color(.appRed) : Color(.appCardbg))
        .cornerRadius(30)
    }
}

#Preview {
    SettingsCell(isReset: true, image: "square.and.arrow.up.fill", title: "Share app")
}
