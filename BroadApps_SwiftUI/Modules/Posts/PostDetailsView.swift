//
//  PostDetailsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 13.02.2024.
//

import SwiftUI

struct PostDetailsView: View {
    @EnvironmentObject var vm: PostsViewModel
    @Environment(\.presentationMode) var presentationMode
    let post: Post
    var body: some View {
        ZStack(alignment: .leading) {
            Color(.appBlack)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(formatDate(date:post.date))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.bottom, 8)
                    Text(post.title)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.bottom, 24)
                    Text(post.text)
                        .foregroundColor(Color(red: 0.75, green: 0.75, blue: 0.75))
                }
                .padding(.horizontal)
            }
        }
        .hiddenTabBar()
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    vm.deletePost(post: post)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "trash")
                })
            }
        })
    }


    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        let dateString = formatter.string(from: date)
        return dateString
    }
}

#Preview {
    PostDetailsView(post: Post(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", date: Date(), id: UUID().uuidString))
}
