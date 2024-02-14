//
//  ResetView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 12.02.2024.
//

import SwiftUI


struct ResetView: View {

    @Binding var isVisible: Bool
    var body: some View {
        VStack(spacing: 0) {

            Text("Reset Confirmation")
                .foregroundColor(.white)
                .font(.headline)
                .padding(.top, 20)
                .padding(.bottom, 2)
            Text("Your progress will be permanently reset. \nDo you really want to delete all data?")
                .font(.footnote)
                .padding(.bottom, 15)
                .lineLimit(2)
                .foregroundColor(.white)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            Divider()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Reset")
                    .fontWeight(.semibold)
                    .foregroundColor(Color(.appTextSecondary))
            })
            .padding(.vertical, 11)
            Divider()
            Button(action: {
                isVisible.toggle()
            }, label: {
            Text("Cancel")
                    .font(.body)
                    .foregroundColor(Color(.appRed))
            })
            .padding(.vertical ,11)
        }
        .frame(width: 270, height: 183)
        .background(Color(.appGray))
        .cornerRadius(16)
    }
}

#Preview {
    ResetView(isVisible: .constant(true))
}
