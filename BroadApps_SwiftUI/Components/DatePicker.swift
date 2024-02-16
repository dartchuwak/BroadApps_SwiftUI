//
//  TextFieldView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI
import Combine

struct DateTextField: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1.0)
                .frame(maxWidth: .infinity)
                .frame(height: 67)
                .foregroundColor(.gray)

            TextField("", text: $text)
                .foregroundColor(.white)
                .placeholder(when: text.isEmpty, placeholder: {
                    Text(placeholder)
                })
                .foregroundColor(.gray)
                .keyboardType(.numberPad)
                .padding(.leading, 20)
                .foregroundColor(.white)
                .onReceive(Just(text)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.text = filtered
                    }
                    applyMask()
                }
        }
    }

    private func applyMask() {
        var numbers = text.filter { "0123456789".contains($0) }
        if numbers.count > 8 {
            numbers = String(numbers.prefix(8))
        }
        var result = ""
        for (index, char) in numbers.enumerated() {
            result.append(char)
            if index == 1 || index == 3 {
                result.append(".")
            }
        }
        self.text = result
    }
}

#Preview {
    DateTextField(text: .constant(""), placeholder: "Headline")
}
