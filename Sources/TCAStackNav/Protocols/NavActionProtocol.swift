//
//  NavActionProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public protocol NavActionProtocol {
    associatedtype Action
    
    static func nodeAction(_ index: Int, action: Action) -> Self
}
