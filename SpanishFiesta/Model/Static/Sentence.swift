//
//  Sentence.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import Foundation

struct Sentence: Codable {
    var id: UUID
    var parentID: UUID
    var inflectionIndex: InflectionIndex
    var infinitive: String
    var inflection: String
    var es: String
    var en: String
    
    var blanked: AttributedString {
        var toReturn = es.lowercased()
        toReturn = toReturn.replacingOccurrences(of: inflection, with: "______")
        if !toReturn.starts(with: "______") {
            let first = String(toReturn.prefix(1)).capitalized
            let other = String(toReturn.dropFirst())
            toReturn = first + other
        }
        return AttributedString(toReturn)
    }
    
    var highlighted: AttributedString {
        if es.lowercased().starts(with: inflection) {
            return (try? AttributedString(markdown: es.lowercased().replacingOccurrences(of: inflection, with: "***\(inflection.capitalize)***"))) ?? .init()
        } else {
            return (try? AttributedString(markdown: es.replacingOccurrences(of: inflection, with: "***\(inflection)***"))) ?? .init()
        }
    }
    
    var hints: [Hint] {
        switch inflectionIndex {
        case .infinitive:
            [
                .MoodOrForm(moodOrForm: .infinitive)
            ]
        case .present_participle:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .presentParticiple)
            ]
        case .past_participle:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .pastParticiple)
            ]
        case .indicative_present_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_present_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .secondPerson)
            ]
        case .indicative_present_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_present_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .firstPersonPlural)
            ]
        case .indicative_present_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .secondPersonPlural)
            ]
        case .indicative_present_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePresent),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .indicative_preterite_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_preterite_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .secondPerson)
            ]
        case .indicative_preterite_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .thirdPerson)
            ]
        case .indicative_preterite_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .firstPersonPlural)
            ]
        case .indicative_preterite_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .secondPersonPlural)
            ]
        case .indicative_preterite_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativePreterite),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .indicative_imperfect_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_imperfect_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .secondPerson)
            ]
        case .indicative_imperfect_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_imperfect_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .firstPersonPlural)
            ]
        case .indicative_imperfect_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .secondPersonPlural)
            ]
        case .indicative_imperfect_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeImperfect),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .indicative_future_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_future_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .secondPerson)
            ]
        case .indicative_future_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .thirdPerson)
            ]
        case .indicative_future_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .firstPersonPlural)
            ]
        case .indicative_future_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .secondPersonPlural)
            ]
        case .indicative_future_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeFuture),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .indicative_conditional_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .firstPerson)
            ]
        case .indicative_conditional_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .secondPerson)
            ]
        case .indicative_conditional_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .thirdPerson)
            ]
        case .indicative_conditional_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .firstPersonPlural)
            ]
        case .indicative_conditional_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .secondPersonPlural)
            ]
        case .indicative_conditional_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .indicative),
                .Tense(tense: .indicativeConditional),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .subjuctive_present_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .firstPerson)
            ]
        case .subjuctive_present_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .secondPerson)
            ]
        case .subjuctive_present_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .thirdPerson)
            ]
        case .subjuctive_present_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .firstPersonPlural)
            ]
        case .subjuctive_present_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .secondPersonPlural)
            ]
        case .subjuctive_present_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctivePresent),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .subjuctive_imperfect1_first:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .firstPerson)
            ]
        case .subjuctive_imperfect1_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .secondPerson)
            ]
        case .subjuctive_imperfect1_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .thirdPerson)
            ]
        case .subjuctive_imperfect1_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .firstPersonPlural)
            ]
        case .subjuctive_imperfect1_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .secondPersonPlural)
            ]
        case .subjuctive_imperfect1_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .subjuctive),
                .Tense(tense: .subjuctiveImperfect),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .imperative_positive_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .secondPerson)
            ]
        case .imperative_positive_vos:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .secondPerson)
            ]
        case .imperative_positive_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .thirdPerson)
            ]
        case .imperative_positive_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .firstPersonPlural)
            ]
        case .imperative_positive_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .secondPersonPlural)
            ]
        case .imperative_positive_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .positiveImperative),
                .Subject(subject: .thirdPersonPlural)
            ]
        case .imperative_negative_second:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .secondPerson)
            ]
        case .imperative_negative_vos:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .secondPerson)
            ]
        case .imperative_negative_third:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .thirdPerson)
            ]
        case .imperative_negative_first_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .firstPersonPlural)
            ]
        case .imperative_negative_vosotros:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .secondPersonPlural)
            ]
        case .imperative_negative_third_plural:
            [
                .Verb(infinitive: infinitive),
                .MoodOrForm(moodOrForm: .negativeImperative),
                .Subject(subject: .thirdPersonPlural)
            ]
        }
    }
}
