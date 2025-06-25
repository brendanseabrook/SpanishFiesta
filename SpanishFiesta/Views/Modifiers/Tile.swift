//
//  Tile.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import SwiftUI

struct Tile: ViewModifier {
    let background: Color
        
    init(_ background: Color) {
        self.background = background
    }
    
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(background)
            }
            .padding(20)
            .clipped()
            .shadow(radius: 5, x:4, y:4)
    }
}
