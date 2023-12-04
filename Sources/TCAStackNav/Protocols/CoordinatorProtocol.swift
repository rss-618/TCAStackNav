//
//  SwiftUIView.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public protocol CoordinatorProtocol: Reducer where State: NavStateProtocol<Screen>, Action: NavActionProtocol<Screen> {
    associatedtype Screen: ScreenProtocol
}
