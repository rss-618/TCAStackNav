//
//  SwiftUIView.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public struct PageView: View {
    
    let store: StoreOf<Page>
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Text(viewStore.state.text)
            Button {
                viewStore.send(.popToRoot)
            } label: {
                Text("Go Back to Root")
            }
        }
    }
    
    init(store: StoreOf<Page>) {
        self.store = store
    }
}

public struct Page: Reducer {
    
    public struct State: Equatable {
        var text: String
        
        init(_ text: String) {
            self.text = text
        }
    }
    
    public enum Action {
        case popToRoot
    }
    
    public var body: some ReducerOf<Self> {
        EmptyReducer()
      }
}
