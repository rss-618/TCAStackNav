//
//  Wrapper.swift
//
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation
import ComposableArchitecture

public enum Wrapper<State: Hashable> {
    
    case push(State, animation: WrapprAnimation = .basic)
    
    public var state: State {
      get {
        switch self {
        case .push(let state, _):
          return state
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
        lhs.state == rhs.state
    }
    
}

public enum WrapprAnimation {
    case basic // Default animation
    // TODO: Add custom animations
}
