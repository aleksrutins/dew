//
//  ArticleView.swift
//  Dew
//
//  Created by Aleks Rutins on 3/20/23.
//

import SwiftUI

struct ArticleView: View {
    @Binding var currentArticle: Int?
    @State var article: ArticleData? = nil
    @EnvironmentObject var gateway: Gateway
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: { currentArticle = nil }) {
                Text("Back")
            }
            if article != nil {
                let data = article!
                ZStack {
                    RoundedRectangle(cornerRadius: 6).fill(colorScheme == .light ? Color.white : Color.black)
                    VStack {
                        Text(data.title).font(.title)
                        Text(data.user.username)
                        WebView(html: data.body_html)
                    }
                }.frame(maxWidth: 1000).padding()
            } else {
                Text("Loading...")
            }
        }
        .scaledToFill()
        .task {
            await loadData()
        }.refreshable {
            await loadData()
        }
    }
    
    func loadData() async {
        do {
            article = try await gateway.getArticle(currentArticle ?? -1)
        } catch let err {
            print(err)
        }
    }
}

struct ArticleView_Previews: PreviewProvider {
    @State static var currentArticle: Int? = 1370571
    static var previews: some View {
        ArticleView(currentArticle: $currentArticle).environmentObject(Gateway())
    }
}
