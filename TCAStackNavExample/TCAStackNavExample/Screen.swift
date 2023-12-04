//
//  Screen.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import TCAStackNav
import ComposableArchitecture

public struct Screen: Reducer {
    
    public enum State {
        case page(Page.State)
    }
    
    public enum Action {
        case page(Page.Action)
    }
    
    public var caseLet: some View {
        
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: /State.page, action: /Action.page) {
          Page()
        }
    }
   
    
}