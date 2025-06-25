//
//  Hint.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

enum HintMoodOrForm: String {
    case infinitive = "Form: Infinitive"
    case presentParticiple = "Form: Present Participle"
    case pastParticiple = "Form: Past Participle"
    case indicative = "Mood: Indicative"
    case subjuctive = "Mood: Subjunctive"
    case positiveImperative = "Form: Positive Imperative"
    case negativeImperative = "Form: Negative Imperative"
}

enum HintTense: String {
    case indicativePresent = "Indicative Present"
    case indicativeImperfect = "Indicative Imperfect"
    case indicativePreterite = "Indicative Preterite"
    case indicativeFuture = "Indicative Future"
    case indicativeConditional = "Indicative Conditional"
    case subjuctivePresent = "Subjuctive Present"
    case subjuctiveImperfect = "Subjuctive Imperfect"
}

enum HintSubject: String {
    case firstPerson = "First Person"
    case secondPerson = "Second Person"
    case thirdPerson = "Third Person"
    case firstPersonPlural = "First Person Plural"
    case secondPersonPlural = "Second Person Plural"
    case thirdPersonPlural = "Third Person Plural"
}


enum Hint {
    case Verb(infinitive: String)
    case MoodOrForm(moodOrForm: HintMoodOrForm)
    case Tense(tense: HintTense)
    case Subject(subject: HintSubject)
    
    var description: String {
        switch self {
        case .Verb(let infinitive):
            return "Verb: \(infinitive)"
        case .MoodOrForm(let moodOrForm):
            return moodOrForm.rawValue
        case .Tense(let tense):
            return "Tense: \(tense.rawValue)"
        case .Subject(subject: let subject):
            return "Subject: \(subject.rawValue)"
        }
    }
    
    var isVerbHint: Bool {
        switch self {
        case .Verb(_):
            true
        default:
            false
        }
    }
    
    var isMoodFormHint: Bool {
        switch self {
        case .MoodOrForm(_):
            true
        default:
            false
        }
    }
    
    var isTenseHint: Bool {
        switch self {
        case .Tense(_):
            true
        default:
            false
        }
    }
    
    var isSubjectHint: Bool {
        switch self {
        case .Subject(_):
            true
        default:
            false
        }
    }
}
