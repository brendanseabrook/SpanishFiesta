//
//  Verb.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import Foundation

struct Verb: Codable {
    let id: UUID
    let infinitive: String
    let def: [String]
    let sentences: [Sentence]
}
