//
//  NavStack.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public struct CoordinatorContentView<
    Coordinator: CoordinatorProtocol,
    RootView: View,
    PotentialView: View
>: View {
    
    let root: RootView
    let store: StoreOf<Coordinator>
    var potentialScreens: (Store<Coordinator.Screen.State, Coordinator.Screen.Action>) -> PotentialView
    
    public init(store: StoreOf<Coordinator>,
                @ViewBuilder _ rootView: () -> RootView,
                @ViewBuilder potentialScreens: @escaping (Store<Coordinator.Screen.State, Coordinator.Screen.Action>) -> PotentialView) {
        self.store = store
        self.root = rootView()
        self.potentialScreens = potentialScreens
    }
    
    public var body: some View {
        NavigationStackStore<Coordinator.Screen.State,
                             Coordinator.Screen.Action,
                             RootView,
                             PotentialView> (self.store.scope(state: \.stack,
                                                              action: { .stack($0) })
        ) {
            root
        } destination: { store in
            potentialScreens(store)
        }
    }
}
