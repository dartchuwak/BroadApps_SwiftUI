//
//  TagView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct TagView: View {
    let text: String
    var body: some View {

       Text(text)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color(.appPrimary))
            .cornerRadius(50)
    }
}

#Preview {
    TagView(text: "football")
}
