//
//  NewArticleView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct EditArticle: View {
    let article: Article
    @State var uiTabarController: UITabBarController?
    @Environment(\.presentationMode) var dismiss
    @State var headline: String = ""
    @State var publisher: String = ""
    @State var text: String = ""
    @State var status: Status = .none
    @State var tagSelection: String = ""
    @EnvironmentObject var vm: ArticlesViewModel

    let tags = ["basketball", "football", "volleyball", "hockey", "box", "golf", "other"]

    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()
            VStack(spacing: 28) {
                HStack {
                    Text("New article")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    Spacer()
                }
                TextFieldView(type: .default, text: $headline, placeholder: "Headline")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(tags, id: \.self) { tag in
                            TagView(isSelected: tagSelection == tag, text: tag)
                                .onTapGesture {
                                    tagSelection = tag
                                }
                        }
                    }
                    .padding(.horizontal, 15)
                }
                .padding(.horizontal, -15)
                StatusView(status: $status)
                TextFieldView(type: .default, text: $publisher, placeholder: "Publisher")
                TextFieldView(type: .default, text: $text, placeholder: "Article text")
                Spacer()

                Button(action: {
                    vm.saveNewArticle(article: Article(headline: headline, tag: tagSelection, status: status, publisher: publisher, text: text, id: UUID().uuidString))
                    dismiss.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .padding(20)
                        .frame(maxWidth: .infinity)
                        .background(Color(.appPrimary))
                        .cornerRadius(20)
                })

            }
            .padding(.top, 10)
            .padding(.horizontal)
        }
        .hiddenTabBar()
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
            }
        })
        .onAppear {
            headline = article.headline
            publisher = article.publisher
            text = article.text
            status = article.status
            tagSelection = article.tag
        }
    }
}

#Preview {
    NewArticleView()
        .environmentObject(ArticlesViewModel())
}
