//
//  SwiftUIView.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public protocol CoordinatorProtocol: Reducer where Action: NavActionProtocol,
                                                   Action.Screen == Screen,
                                                   State: NavStateProtocol,
                                                   State.Screen == Screen {
    associatedtype Screen: ScreenProtocol
}
