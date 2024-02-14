//
//  PostsCell.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 13.02.2024.
//

import SwiftUI

struct PostsCell: View {
    let post: Post

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(formatDate(date:post.date))
                    .font(.footnote)
                    .foregroundColor(.gray)
                Spacer()
            }

            Text(post.title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .padding(30)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color(.appPrimary).opacity(0.15))
        .cornerRadius(30)
    }

    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let dateString = formatter.string(from: date)
        return dateString
    }
}

#Preview {
    PostsCell(post: Post(title: "Title", text: "Post Text", date: Date()))
}
