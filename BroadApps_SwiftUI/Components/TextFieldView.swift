//
//  TextFieldView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct TextFieldView: View {
    let type: UIKeyboardType
    @Binding var text: String
    let placeholder: String
    var body: some View {

        TextField("", text: $text)
            .frame(height: 62)
            .padding(.leading, 20)
            .foregroundColor(.white)
            .placeholder(when: text.isEmpty) {
                Text(placeholder).foregroundColor(.gray)
                    .padding(.leading, 20)
            }
            .keyboardType(type)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 1.0)
                    .frame(maxWidth: .infinity)
                    .frame(height: 62)
                    .foregroundColor(.gray)
            )
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
    TextFieldView(type: .default, text: .constant(""), placeholder: "Headline")
}
