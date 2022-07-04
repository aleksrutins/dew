//
//  HomeView.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import SwiftUI

struct HomeView: View {
    @State var articles = [Article]()
    @EnvironmentObject var gateway: Gateway
    var body: some View {
        List(articles, id: \.id) { article in
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 10).fill(Color("BgAccent"))
                VStack(alignment: .leading) {
                    Text(article.title).font(.title2).multilineTextAlignment(.leading)
                    Text(article.description).multilineTextAlignment(.leading)
                }.padding()
            }
        }.task {
            await loadData()
        }
    }
    
    func loadData() async {
        do {
            articles = try await gateway.getArticles()
        }
        catch let err {
            print(err)
            articles = [Article]()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(Gateway())
    }
}
