//
//  PlaybackSettings.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-25.
//

enum PlaybackSettings: Int, Codable, CaseIterable, Equatable {
    case none
    case justSyllibles
    case justWord
    case both
    
    var label: String {
        switch self {
        case .none:
            return "None"
        case .justSyllibles:
            return "Syllables"
        case .justWord:
            return "Word"
        case .both:
            return "Both"
        }
    }
}
