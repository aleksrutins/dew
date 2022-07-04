//
//  DewApp.swift
//  Dew
//
//  Created by Aleks Rutins on 03/07/2022.
//

import SwiftUI

@main
struct DewApp: App {
    let gateway = Gateway()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gateway)
        }.windowStyle(.hiddenTitleBar)
    }
}
