//
//  NavStateProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public class NavStateProtocol<Screen: ScreenProtocol> {
    var stack: StackState<Screen.State> = .init()
}
