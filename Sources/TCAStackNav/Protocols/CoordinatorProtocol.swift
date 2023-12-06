//
//  SwiftUIView.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public protocol CoordinatorProtocol: Reducer where Action: NavActionProtocol,
                                                   State: NavStateProtocol,
                                                   State.Screen == Action.Screen { }

public extension CoordinatorProtocol {
    func forEachScreen(@ReducerBuilder<State.Screen.State, State.Screen.Action> screenReducer: () -> State.Screen) -> some ReducerOf<Self> {
        return self.forEach(\.stack, action: /Action.stack) {
            screenReducer()
        }
    }
}
