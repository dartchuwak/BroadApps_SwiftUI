//
//  ArticlesView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct ArticlesView: View {
    var body: some View {
        List {
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
               Image(systemName: "plus.circle.fill")
            }
        }
    }
}

#Preview {
    ArticlesView()
}
