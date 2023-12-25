//
//  NavStateProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public protocol NavStateProtocol {
    associatedtype Screen: ScreenProtocol
    var stack: StackState<Screen.State> { get set }
}
