//
//  VoiceSetting.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-25.
//

enum VoiceSetting: String, Codable {
    case spanish = "es"
    case latinAmericanSpanish = "es-419"
    
    var label: String {
        switch self {
        case .spanish:
            "European"
        case .latinAmericanSpanish:
            "Latin American"
        }
    }
}
