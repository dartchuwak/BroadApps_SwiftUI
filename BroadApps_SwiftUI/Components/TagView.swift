//
//  TagView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct TagView: View {

    var isSelected: Bool
    let text: String
    var body: some View {

       Text(text)
            .font(.system(size: 11))
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(.appPrimary))
            .cornerRadius(50)
            .opacity(isSelected ? 1 : 0.5)
    }
}

#Preview {
    TagView(isSelected: false, text: "football")
}
