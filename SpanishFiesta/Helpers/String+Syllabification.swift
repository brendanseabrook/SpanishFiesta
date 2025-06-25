//
//  String+Syllabification.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-22.
//


protocol Region {
    static var name: String { get }
    static var description: String { get }
    static var unbreakableConsonents: [(Character, Character)] { get }
    //static var phonics: [Character : Character?] { get }
}


struct Castilian: Region {
    static let name = "Castilian"
    static let description = "The version of Spanish mainly spoken in Spain"
    
    static let unbreakableConsonents: [(Character, Character)] = [
        ("l", "l"),
        ("p", "r"),
        ("b", "r"),
        ("p", "l"),
        ("b", "l"),
        ("f", "r"),
        ("f", "l"),
        ("g", "r"),
        ("g", "l"),
        ("c", "r"),
        ("c", "l"),
        ("d", "r"),
        ("t", "r")
    ]
    
//    static let phonics: [Character : Character?] = [
//        "a" : "a",
//        "á" : "A",
//        "e" : "e",
//        "é" : "E",
//        "f" : "f",
//        "h" : nil,
//        "í" : "I",
//        "j" : "x",
//        "k" : "k",
//        "m" : "m",
//        "ñ" : "ɲ",
//        "o" : "o",
//        "ó" : "O",
//        "p" : "p",
//        "q" : "k",
//        "t" : "t",
//        "ú" : "U",
//        "w" : "w"
//    ]

}


extension String {
    func syllabify(region: any Region.Type = Castilian.self) -> [String] {
        var remaining = self
        var syllibles = [String]()
        var nextSyllible = String.empty
        while !remaining.isEmpty {
            let nextCharacter = remaining.removeFirst()
            nextSyllible += String(nextCharacter)
            if nextCharacter.isVowelOrAccentedVowel {
                if nextCharacter.isStrongVowel && remaining.first?.isStrongVowel == true {
                    syllibles.append(nextSyllible)
                    nextSyllible = .empty
                    continue
                } else if remaining.first?.isVowelOrAccentedVowel == true {
                    continue
                }
                
                if remaining.count > 1 {
                    let p1 = remaining[remaining.startIndex]
                    let p2 = remaining[remaining.index(after: remaining.startIndex)]
                    if !p1.isVowelOrAccentedVowel && !p2.isVowelOrAccentedVowel &&
                        !region.unbreakableConsonents.contains(where: { (r1, r2) in
                            p1 == r1 && p2 == r2
                        })
                    {
                        if remaining.count > 2 {
                            let p3 = remaining[remaining.index(remaining.startIndex, offsetBy: 2)]
                            if p2 == "s" && !p3.isVowelOrAccentedVowel {
                                nextSyllible += String(remaining.removeFirst())
                            }
                        }
                        nextSyllible += String(remaining.removeFirst())
                    }
                } else {
                    nextSyllible.append(remaining)
                }
                syllibles.append(nextSyllible)
                nextSyllible = .empty
            }
        }
        return syllibles
    }
}
