//
//  NavActionProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public protocol NavActionProtocol {
    associatedtype Screen: ScreenProtocol
    static func stack(id: Screen.State.ID, action: Screen.Action) -> Self
    static func updateStack(stack: IdentifiedArrayOf<Screen.State>) -> Self
}
