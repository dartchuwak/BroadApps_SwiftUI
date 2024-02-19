//
//  ShareView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 19.02.2024.
//

import Foundation
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return activityViewController
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}
