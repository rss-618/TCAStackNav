//
//  CoordinatorStackView.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public struct CoordinatorStackView<
    Coordinator: CoordinatorProtocol,
    Screen: ScreenProtocol,
    RootView: View,
    PotentialView: View
>: View where Screen == Coordinator.Action.Screen,
              Screen == Coordinator.State.Screen {
    
    let root: RootView
    let store: StoreOf<Coordinator>
    var potentialScreens: (StoreOf<Screen>) -> PotentialView
    
    public init(store: StoreOf<Coordinator>,
                @ViewBuilder _ rootView: () -> RootView,
                @ViewBuilder potentialScreens: @escaping (StoreOf<Screen>) -> PotentialView) {
        self.store = store
        self.root = rootView()
        self.potentialScreens = potentialScreens
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: \.stack) {
            NavigationStack(path: $0.binding(send: { .updateStack(stack: $0) })) {
                root.navigationDestination(for: Screen.State.self) { state in
                    potentialScreens(store.scope(state: { $0.stack[id: state.id] ?? state },
                                                 action: { .stack(id: state.id, action: $0) }))
                }
            }
        }
    }
}
