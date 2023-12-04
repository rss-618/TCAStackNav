//
//  NavStateProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation

public protocol NavStateProtocol: Equatable {
    associatedtype Screen: ScreenProtocol
    
    var stack: [Wrapper<Screen>] { get set }
}
