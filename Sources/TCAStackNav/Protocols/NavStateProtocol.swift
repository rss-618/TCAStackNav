//
//  NavStateProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation

public protocol NavStateProtocol {
    associatedtype Screen: Hashable
    
    var stack: [Wrapper<Screen>] { get set }
}
