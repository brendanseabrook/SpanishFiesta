//
//  HomeMenuButton.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-24.
//

import SwiftUI

struct HomeMenuButton: ButtonStyle {
    static let offset = 10.0
    
    @Binding var color: Color
    
    init(color: Color) {
        self._color = .constant(color)
    }
    
    init(color: Binding<Color>) {
        self._color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(configuration.isPressed ? color.opacity(0.75) : color)
            .offset(y: configuration.isPressed ? Self.offset : 0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
