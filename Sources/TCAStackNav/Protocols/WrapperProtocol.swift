//
//  WrapperProtocol.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation

public protocol WrapperProtocol {
    associatedtype Screen
    
    static func push(_ state: Screen, animation: WrapprAnimation) -> Self
}

extension Wrapper: WrapperProtocol {}
