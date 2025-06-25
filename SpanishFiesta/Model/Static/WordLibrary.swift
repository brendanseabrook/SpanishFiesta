//
//  WordLibrary.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import Foundation

struct WordLibrary: Codable {
    enum WordLibraryError: LocalizedError {
        case usedBeforeLoad
        case loadingError(inner: Error)
    }
    
    var verbs: [UUID: Verb]

    private static let verbs = Bundle.main.url(forResource: "verbs", withExtension: "json")!

    static var _current: WordLibrary? = nil
    static var current: WordLibrary {
        get throws {
            if _current == nil {
                throw WordLibraryError.usedBeforeLoad
            }
            return _current!
        }
    }
    
    static func load() throws {
        do {
            _current = try JSONDecoder().decode(WordLibrary.self, from: try Data(contentsOf: Self.verbs))
        } catch {
            throw WordLibraryError.loadingError(inner: error)
        }
    }
}
