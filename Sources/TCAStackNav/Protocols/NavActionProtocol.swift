//
//  NavActionProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public class NavActionProtocol<Screen: ScreenProtocol> {
    required init() { }
    static func stack(_: StackAction<Screen.State, Screen.Action>) -> Self {
        return self.init()
    } // To be inhertied by enum
}
