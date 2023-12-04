//
//  Screen.swift
//  TCAStackNavExample
//
//  Created by Ryan Schildknecht on 12/3/23.
//

import SwiftUI
import TCAStackNav

public struct Screen: ScreenProtocol {
    
    public init(text: String) {
        self.text = text
        
    }
    
    let text: String
    
    public var view: some View {
        Text(text)
    }
    
}
