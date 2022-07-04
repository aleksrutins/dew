//
//  ContentView.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State var searchContents: String = ""
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Home", destination: HomeView())
            }
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
