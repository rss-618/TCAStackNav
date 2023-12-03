//
//  StackNavError.swift
//  
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import Foundation

public enum StackNavError: LocalizedError {
    case message(String)
    
    public var errorDescription: String {
        switch self {
        case .message(let text):
            return text
        }
    }
}
