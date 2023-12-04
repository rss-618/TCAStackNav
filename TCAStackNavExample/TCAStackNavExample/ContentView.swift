//
//  ContentView.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import TCAStackNav

struct ContentView: View {
    @State var additionalScreens: [Wrapper<Screen>] = [.push(.init(text: "one"))]
    var body: some View {
        NavStack($additionalScreens) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
