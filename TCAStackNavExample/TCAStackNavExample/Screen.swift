//
//  Screen.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import TCAStackNav
import ComposableArchitecture

public struct ExampleScreen: ScreenProtocol {    
    
    public enum State: Hashable, Identifiable {
        
        case page(Page.State)
        
        public func hash(into hasher: inout Hasher) {
            switch self {
            case .page(let state):
                hasher.combine(state.id.hashValue)
            }
        }
        
        public var id: UUID {
            switch self {
            case .page(let state):
                state.id
            }
        }
    }
    
    public enum Action {
        case page(Page.Action)
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.page, action: /Action.page) {
          Page()
        }
    }
   
    
}
