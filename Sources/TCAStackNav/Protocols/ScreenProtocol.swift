//
//  ScreenProtocol.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import ComposableArchitecture

public protocol ScreenProtocol: Hashable {
    associatedtype ScreenView: View
    
    var view: ScreenView { get }
}
