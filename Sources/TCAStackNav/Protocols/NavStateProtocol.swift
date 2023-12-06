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
    var stack: IdentifiedArrayOf<Screen.State> { get set }
}
