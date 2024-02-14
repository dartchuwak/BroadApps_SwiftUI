//
//  NewPostView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 13.02.2024.
//

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var vm: PostsViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var title = ""
    @State var text = ""
    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()
            VStack(spacing: 16) {
                HStack {
                    Text("New post")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                }

                TextFieldView(type: .default, text: $title, placeholder: "Name post")
                TextFieldView(type: .default, text: $text, placeholder: "Text")
                Spacer()
            }
            .padding()
            VStack {
                Spacer()

                Button(action: {
                    let date = Date()
                    let post = Post(title: title, text: text, date: date)
                    vm.savePost(post: post)
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Create")
                        .foregroundColor(.white)
                        .font(.body)
                })
                .frame(maxWidth: .infinity)
                .padding(20)
                .background(Color(.appPrimary))
                .cornerRadius(20)
                .padding(.horizontal)
            }


        }
        .hiddenTabBar()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                })
            }
        }
    }
}

#Preview {
    NewPostView()
        .environmentObject(PostsViewModel())
}
