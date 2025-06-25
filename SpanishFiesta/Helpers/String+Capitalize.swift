//
//  String+Capitalize.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

extension String {
    var capitalize: String {
        let first = self.first?.uppercased() ?? ""
        let rest = self.dropFirst()
        return first + rest
    }
}
