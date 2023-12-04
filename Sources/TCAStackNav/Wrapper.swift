//
//  Wrapper.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public enum Wrapper<Screen: ScreenProtocol> {
    
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

extension Wrapper: Hashable {
    public static func == (lhs: Wrapper, rhs: Wrapper) -> Bool {
        lhs.screen == rhs.screen
    }
    
}

public enum WrapprAnimation {
    case basic // Default animation
    // TODO: Add custom animations
}
