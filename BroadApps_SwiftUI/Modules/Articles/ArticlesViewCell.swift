//
//  ArticlesViewCell.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct ArticlesViewCell: View {
    let tag: String
    let headline: String

    var body: some View {
        VStack(alignment: .leading) {
            TagView(isSelected: true, text: tag)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(headline)
                .foregroundColor(.white)
                .font(.system(size: 22))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 30, alignment: .topLeading)
        .background(Color(.appPrimary).opacity(0.15))
        .cornerRadius(30)
    }
}

#Preview {
    ArticlesViewCell(tag: "football", headline: "How s")
}
