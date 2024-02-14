//
//  PostsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct PostsView: View {

    @EnvironmentObject var vm: PostsViewModel
    @State var showNewPostView = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.appBlack
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Posts")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal)

                    ScrollView {
                        if vm.posts.isEmpty {
                            VStack(spacing: 10) {
                                Text("No posts added")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("You don't have any posts added")
                                    .font(.body)
                                    .foregroundColor(.appTabBar)
                            }
                            .padding(.top, 200)
                        } else {
                            ForEach(vm.posts, id:\.self) { post in
                                PostsCell(post: post)
                            }
                        }
                    }
                    Spacer()
                }

                NavigationLink(destination: NewPostView(), isActive: $showNewPostView) {
                    EmptyView()
                }
            }
            .showTabBar()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showNewPostView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(.appPrimary))
                    })

                }
            }
        }
    }
}

#Preview {
    PostsView()
        .environmentObject(PostsViewModel())
}
