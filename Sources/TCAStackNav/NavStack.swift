//
//  NavStack.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public struct NavStack<
    ScreenType: ScreenProtocol,
    RootView: View,
    PotentialView: View
>: View {
    let root: RootView
    @Binding var stack: [Wrapper<ScreenType>]
    var potentialScreens: (Wrapper<ScreenType>) -> PotentialView
    
    public init(_ stack: Binding<[Wrapper<ScreenType>]>,
                @ViewBuilder _ rootView: () -> RootView,
                @ViewBuilder potentialScreens: @escaping (Wrapper<ScreenType>) -> PotentialView) {
        self._stack = stack
        self.root = rootView()
        self.potentialScreens = potentialScreens
    }
    
    public var body: some View {
        NavigationStack(path: $stack) {
            root.navigationDestination(for: Wrapper<ScreenType>.self) { wrapper in
                potentialScreens(wrapper)
            }
        }
    }
}
