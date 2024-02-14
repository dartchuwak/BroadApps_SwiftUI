//
//  ArticlesView.swift
//  BroadApps_SwiftUI
//
//  Created by Evgenii Mikhailov on 09.02.2024.
//

import SwiftUI

struct ArticlesView: View {

    @EnvironmentObject var vm: ArticlesViewModel
    @State var isShowingNewArticleView: Bool = false

    var body: some View {
        NavigationView {
            ZStack {
                Color(.appBlack)
                    .ignoresSafeArea()

                VStack {
                    HStack {
                        Text("Articles")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Spacer()
                    }

                    ScrollView {
                        if vm.articles.isEmpty {
                            VStack(spacing: 10) {
                                Text("No articles added")
                                    .foregroundColor(.white)
                                    .font(.title)
                                Text("Add an article with the plus icon above")
                                    .foregroundColor(.gray)
                                    .font(.body)
                            }
                            .padding(.top, 200)

                        } else {
                            ForEach(vm.articles, id: \.self) { item in
                                NavigationLink {
                                    ArticleDetailsView(article: item)
                                } label: {
                                    ArticlesViewCell(tag: item.tag, headline: item.headline)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal)

                NavigationLink(destination: NewArticleView(), isActive: $isShowingNewArticleView) {
                    EmptyView()
                }
            }
            .showTabBar()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isShowingNewArticleView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color(.appPrimary))
                    })

                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ArticlesView()
        .environmentObject(ArticlesViewModel())
}
