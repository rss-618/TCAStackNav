//
//  WrapperProtocol.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
//TODO: With animation introduce this into the stack
public protocol WrapperProtocol {
    associatedtype Screen
    
    static func push(_ state: Screen, animation: WrapprAnimation) -> Self
}

extension Wrapper: WrapperProtocol {}
