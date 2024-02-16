//
//  Article.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 15.02.2024.
//

import Foundation

struct Article: Hashable {
    let headline: String
    let tag: String
    let status: Status
    let publisher: String
    let text: String
    let id: String
}
