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
            NavStack(viewStore.binding(get: \.stack, send: { .setStack($0) })) {
                VStack {
                    Text("First Page")
                }
                .padding()
            } potentialScreens: { wrapper in
                switch wrapper.screen {
                case .page(let state):
                    PageView(store: StoreOf<Page>(initialState: state) {
                        Page()
                    })
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
        var stack: [Wrapper<Screen.State>] = [
            .push(.page(.init("Hello Dude"))),
            .push(.page(.init("Cmon Man")))
        ]
    }
    
    enum Action: NavActionProtocol {
        case nodeAction(_ index: Int, action: Screen.Action)
        case setStack([Wrapper<Screen.State>])
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
          switch action {
          case .nodeAction(_, action: .page(.popToRoot)):
              state.stack.removeAll()
          default:
            break
          }
          return .none
        }.forEach(<#T##toElementsState: WritableKeyPath<_, IdentifiedArray<Hashable, ElementState>>##WritableKeyPath<_, IdentifiedArray<Hashable, ElementState>>#>, action: <#T##KeyPath<Case<_>, Case<IdentifiedAction<Hashable, ElementAction>>>#>, element: <#T##() -> Reducer#>)
      }
}
