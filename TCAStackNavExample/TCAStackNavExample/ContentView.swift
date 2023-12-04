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
    
    let store: StoreOf<Content>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            NavStack(viewStore.binding(get: \.stack, send: { .updateStack($0) })) {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .padding()
            } potentialScreens: { wrapper in
                SwitchStore(StoreOf(initialState: wrapper.screen, reducer: Screen())) {
                    
                }
            }
        }
        
    }
    
    public init(store: StoreOf<Content>) {
        self.store = store
    }
}

struct Content: Reducer {

    struct State: NavStateProtocol, Equatable {
        var stack: [Wrapper<Screen>] = []
    }
    
    enum Action: NavActionProtocol {
        case nodeAction(_ index: Int, action: Screen.Action)
        case updateStack([Wrapper<Screen>])
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .updateStack(let stack):
                state.stack = stack
            default:
                break
            }
            return .none
        }
    }
}
