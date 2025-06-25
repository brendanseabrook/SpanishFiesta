//
//  TuVosSetting.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-24.
//

enum TuVosSetting: Int, Codable, CaseIterable {
    case justTu
    case justVos
    case bothTuAndVos
    
    var label: String {
        switch self {
        case .justTu:
            "Just Tu"
        case .justVos:
            "Just Vos"
        case .bothTuAndVos:
            "Both Tu and Vos"
        }
    }
}
