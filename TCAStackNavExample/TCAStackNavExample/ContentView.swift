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
            NavStack<Content, Text, Text>(store: store) {
                Text("First Page")
            } potentialScreens: { state in
                Text("Other")
            }
        }
        
    }
    
    public init(store: StoreOf<Content>) {
        self.store = store
    }
}

struct Content: CoordinatorProtocol {
    typealias Screen = ExampleScreen
    
    class State: NavStateProtocol, Equatable {
        typealias Screen = ExampleScreen
        
        var id : UUID
        
        static func == (lhs: Content.State, rhs: Content.State) -> Bool {
            lhs.id == rhs.id
        }
        
        var stack: StackState<Screen.State>  = .init([.page(.init("Page"))])
        
        public init(id: UUID = UUID()) {
            self.id = id
        }
    }
    
    enum Action: NavActionProtocol {
        typealias Screen = ExampleScreen
        
        case stack(StackAction<Screen.State, Screen.Action>)
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            default:
                break
            }
            return .none
        }
    }
    
}
