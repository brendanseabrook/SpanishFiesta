//
//  Character+accents.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-22.
//

extension Character {
    
    var isStrongVowel: Bool {
        switch self {
        case "a", "e", "o", "á", "é", "ó", "ú", "í":
            return true
        default:
            return false
        }
    }

    var isVowelOrAccentedVowel: Bool {
        switch self {
        case "a", "e", "i", "o", "u", "á", "é", "í", "ó", "ú":
            true
        default:
            false
        }
    }
}
