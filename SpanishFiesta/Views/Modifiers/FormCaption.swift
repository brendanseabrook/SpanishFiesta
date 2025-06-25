//
//  FormCaption.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-25.
//

import SwiftUI

struct FormCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}
