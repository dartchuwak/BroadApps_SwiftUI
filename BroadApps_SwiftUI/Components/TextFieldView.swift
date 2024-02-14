//
//  TextFieldView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct TextFieldView: View {

    @Binding var text: String
    let placeholder: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1.0)
                .frame(width: .infinity, height: 62)
                .foregroundColor(.gray)

            TextField("", text: $text)
                .padding(.leading, 20)
                .foregroundColor(.white)
                .placeholder(when: text.isEmpty) {
                    Text(placeholder).foregroundColor(.gray)
                        .padding(.leading, 20)
                }
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    TextFieldView(text: .constant(""), placeholder: "Headline")
}
