//
//  TCAStackNavExampleApp.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAStackNavExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: StoreOf<Content>(initialState: .init(), reducer: {
                Content()
            }))
        }
    }
}
