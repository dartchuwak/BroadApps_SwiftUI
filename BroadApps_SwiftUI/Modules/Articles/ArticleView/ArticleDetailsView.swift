//
//  ArticleDetailsView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 10.02.2024.
//

import SwiftUI

struct ArticleDetailsView: View {

    @Environment(\.presentationMode) var dismiss
    @EnvironmentObject var vm: ArticlesViewModel
    let article: Article
    var body: some View {
        ZStack {
            Color(.appBlack)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(article.status.rawValue)
                        .foregroundColor(.white)
                    Spacer()
                    TagView(isSelected: true, text: article.tag)
                }
                Text(article.publisher)
                    .foregroundColor(.gray)
                Text(article.text)
                    .foregroundColor(.white)

                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle(article.headline)
        .navigationBarBackButtonHidden()
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .onTapGesture {
                        dismiss.wrappedValue.dismiss()
                    }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "trash")
                    .foregroundColor(.white)
                    .onTapGesture {
                        vm.delete(item: article)
                        dismiss.wrappedValue.dismiss()
                    }
            }
        })
    }
}

#Preview {
    ArticleDetailsView(article: Article(headline: "Headline", tag: "football", status: .writing, publisher: "Publisher", text: "Text"))
        .environmentObject(ArticlesViewModel())
}
