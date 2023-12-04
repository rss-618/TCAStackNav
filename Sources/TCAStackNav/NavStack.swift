//
//  NavStack.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public struct NavStack<ScreenType: ScreenProtocol, RootView: View> {
    let root: RootView
    @Binding var stack: [Wrapper<ScreenType>]
    
    public init(_ stack: Binding<[Wrapper<ScreenType>]>, _ rootView: () -> RootView) throws {
        self._stack = stack
        self.root = rootView()
    }
    
    public var body: some View {
        NavigationStack(path: $stack) {
            root.navigationDestination(for: Wrapper<ScreenType>.self) { wrapper in
                wrapper.screen.view
            }
        }
    }
}
