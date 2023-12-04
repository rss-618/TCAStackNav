//
//  Wrapper.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public enum Wrapper<Screen: Hashable>: Hashable {
    
    public static func == (lhs: Wrapper<Screen>, rhs: Wrapper<Screen>) -> Bool {
        lhs.screen == rhs.screen
    }
    
    
    case push(Screen, animation: WrapprAnimation = .basic)
    
    public var screen: Screen {
      get {
        switch self {
        case .push(let screen, _):
          return screen
        }
      }
      set {
        switch self {
        case .push(_, let animation):
          self = .push(newValue, animation: animation)
        }
      }
    }
}

public enum WrapprAnimation {
    case basic // Default animation
    // TODO: Add custom animations
}
