//
//  ContentView.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import TCAStackNav
import ComposableArchitecture

struct ContentView: View {
    
    let store = StoreOf<Content>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
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
}

struct Content: Reducer {

    struct State: NavStateProtocol {
        var stack: [Wrapper<Screen>] = [
            .push(.init()),
            .push(.init(text: "two")),
            .push(.init(text: "three")),
            .push(.init(text: "four")),
            .push(.init(text: "five"))
        ]
    }
    
    struct Action: NavActionProtocol {
    case nodeAction(_ index: Int, action: Screen.)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
          switch action {
          default:
            break
          }
          return .none
        }.fo
      }
}
