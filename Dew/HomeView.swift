//
//  HomeView.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State var articles = [ArticleMeta]()
    @State var searchContent = ""
    @EnvironmentObject var gateway: Gateway
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        HStack {
            ScrollView {
                LazyVStack {
                    ForEach(articles, id: \.id) { article in
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 6).fill(colorScheme == .light ? Color.white : Color.black)
                            VStack(alignment: .leading) {
                                Text(article.title).font(.title2).multilineTextAlignment(.leading)
                                HStack {
                                    ForEach(article.tag_list) { Text("#" + $0) }
                                }
                            }.padding()
                        }
                        .frame(maxWidth: 500)
                        .padding([.horizontal])
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
