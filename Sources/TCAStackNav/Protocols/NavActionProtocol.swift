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
    static func stack(_: StackAction<Screen.State, Screen.Action>) -> Self
}
