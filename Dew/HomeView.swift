//
//  HomeView.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State var articles = [ArticleMeta]()
    @State var currentArticle: Int? = nil
    @State var searchContent = ""
    @EnvironmentObject var gateway: Gateway
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        if currentArticle == nil {
            HStack {
                ScrollView {
                    LazyVStack {
                        ForEach(articles, id: \.id) { article in
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 6).fill(colorScheme == .light ? Color.white : Color.black)
                                VStack(alignment: .leading) {
                                    if article.cover_image != nil {
                                        AsyncImage(url: article.cover_image)
                                            .frame(maxWidth: 500)
                                            .clipShape(RoundedRectangle(cornerRadius: 6))
                                            .scaledToFit()
                                            .clipped()
                                    }
                                    VStack(alignment: .leading) {
                                        Text(String(article.id))
                                        Text(article.title).font(.title2).multilineTextAlignment(.leading)
                                        HStack {
                                            ForEach(article.tag_list) { Text("#" + $0) }
                                        }
                                    }.padding()
                                }
                            }
                            .frame(maxWidth: 500)
                            .padding([.horizontal])
                            .onTapGesture {
                                currentArticle = article.id
                            }
                        }
                    }
                    .task {
                        await loadData()
                    }
                    .refreshable {
                        await loadData()
                    }
                    .searchable(text: $searchContent)
                    .padding([.vertical])
                }
            }
        } else {
            ArticleView(currentArticle: $currentArticle)
        }
    }
    
    func loadData() async {
        do {
            articles = try await gateway.getArticles()
        }
        catch let err {
            print(err)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Gateway())
    }
}
