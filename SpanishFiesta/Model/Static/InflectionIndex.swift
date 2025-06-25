//
//  InflectionIndex.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//


enum InflectionIndex: Int, CaseIterable, Codable {
    //0
    case infinitive
    
    //1,2
    case present_participle
    case past_participle
    
    //3,4,5,6,7,8
    case indicative_present_first
    case indicative_present_second
    case indicative_present_third
    case indicative_present_first_plural
    case indicative_present_vosotros
    case indicative_present_third_plural
    
    //9,10,11,12,13,14
    case indicative_preterite_first
    case indicative_preterite_second
    case indicative_preterite_third
    case indicative_preterite_first_plural
    case indicative_preterite_vosotros
    case indicative_preterite_third_plural
    
    //15,16,17,18,19,20
    case indicative_imperfect_first
    case indicative_imperfect_second
    case indicative_imperfect_third
    case indicative_imperfect_first_plural
    case indicative_imperfect_vosotros
    case indicative_imperfect_third_plural
    
    //21,22,23,24,25,26
    case indicative_future_first
    case indicative_future_second
    case indicative_future_third
    case indicative_future_first_plural
    case indicative_future_vosotros
    case indicative_future_third_plural
    
    //27,28,29,30,31,32
    case indicative_conditional_first
    case indicative_conditional_second
    case indicative_conditional_third
    case indicative_conditional_first_plural
    case indicative_conditional_vosotros
    case indicative_conditional_third_plural
    
    //33,34,35,36,37,38
    case subjuctive_present_first
    case subjuctive_present_second
    case subjuctive_present_third
    case subjuctive_present_first_plural
    case subjuctive_present_vosotros
    case subjuctive_present_third_plural
    
    //39,40,41,42,43,44
    case subjuctive_imperfect1_first
    case subjuctive_imperfect1_second
    case subjuctive_imperfect1_third
    case subjuctive_imperfect1_first_plural
    case subjuctive_imperfect1_vosotros
    case subjuctive_imperfect1_third_plural
    
    //45,46,47,48,49,50
    case imperative_positive_second
    case imperative_positive_vos
    case imperative_positive_third
    case imperative_positive_first_plural
    case imperative_positive_vosotros
    case imperative_positive_third_plural
    
    //51,52,53,54,55,56
    case imperative_negative_second
    case imperative_negative_vos
    case imperative_negative_third
    case imperative_negative_first_plural
    case imperative_negative_vosotros
    case imperative_negative_third_plural
    
    var isVosotros: Bool {
        switch self {
        case .indicative_present_vosotros,
                .indicative_imperfect_vosotros,
                .indicative_preterite_vosotros,
                .indicative_future_vosotros,
                .indicative_conditional_vosotros,
                .subjuctive_present_vosotros,
                .subjuctive_imperfect1_vosotros,
                .imperative_positive_vosotros,
                .imperative_negative_vosotros:
            true
        default:
            false
            
        }
    }
    
    var subjectDescription: String? {
        switch self {
        case .indicative_present_first,
                .indicative_imperfect_first,
                .indicative_preterite_first,
                .indicative_future_first,
                .indicative_conditional_first,
                .subjuctive_present_first,
                .subjuctive_imperfect1_first:
            return "First"
        case .indicative_present_second,
                .indicative_imperfect_second,
                .indicative_preterite_second,
                .indicative_future_second,
                .indicative_conditional_second,
                .subjuctive_present_second,
                .subjuctive_imperfect1_second,
                .imperative_positive_vos,
                .imperative_negative_vos,
                .imperative_positive_second,
                .imperative_negative_second:
            return "Second"
        case .indicative_present_third,
                .indicative_imperfect_third,
                .indicative_preterite_third,
                .indicative_future_third,
                .indicative_conditional_third,
                .subjuctive_present_third,
                .subjuctive_imperfect1_third,
                .imperative_positive_third,
                .imperative_negative_third:
            return "Third"
        case .indicative_present_first_plural,
                .indicative_imperfect_first_plural,
                .indicative_preterite_first_plural,
                .indicative_future_first_plural,
                .indicative_conditional_first_plural,
                .subjuctive_present_first_plural,
                .subjuctive_imperfect1_first_plural,
                .imperative_positive_first_plural,
                .imperative_negative_first_plural:
            return "First Plural"
        case .indicative_present_vosotros,
                .indicative_imperfect_vosotros,
                .indicative_preterite_vosotros,
                .indicative_future_vosotros,
                .indicative_conditional_vosotros,
                .subjuctive_present_vosotros,
                .subjuctive_imperfect1_vosotros,
                .imperative_positive_vosotros,
                .imperative_negative_vosotros:
            return "Vosotros"
        case .indicative_present_third_plural,
                .indicative_imperfect_third_plural,
                .indicative_preterite_third_plural,
                .indicative_future_third_plural,
                .indicative_conditional_third_plural,
                .subjuctive_present_third_plural,
                .subjuctive_imperfect1_third_plural,
                .imperative_positive_third_plural,
                .imperative_negative_third_plural:
            return "Third Plural"
        default:
            return nil
        }
    }
    
    var moodFormDescription: String {
        switch self.rawValue {
        case 0..<3, 45..<57:
            return "Form"
        case 3..<45:
            return "Mood"
        default:
            fatalError()
        }
    }
    
    var moodFormValue: String {
        switch self.rawValue {
        case 0:
            return "Infinitive"
        case 1:
            return "Present Participle"
        case 2:
            return "Past Participle"
        case 3..<33:
            return "Indicative"
        case 33..<45:
            return "Subjunctive"
        case 45..<51:
            return "Imperative (Positive)"
        case 51..<57:
            return "Imperative (Negative)"
        default:
            fatalError()
        }
    }
    
    var tenseLabel: String? {
        switch self.rawValue {
        case 3..<9, 33..<39:
            return "Tense"
        case 9..<15:
            return "Tense"
        case 15..<21, 39..<45:
            return "Tense"
        case 21..<27:
            return "Tense"
        case 27..<33:
            return "Tense"
//        case 45..<51:
//            return "State"
//        case 51..<57:
//            return "State"
        default:
            return nil
        }
    }
    
    var tenseDescription: String? {
        switch self.rawValue {
        case 3..<9, 33..<39:
            return "Present"
        case 9..<15:
            return "Preterite"
        case 15..<21, 39..<45:
            return "Imperfect"
        case 21..<27:
            return "Future"
        case 27..<33:
            return "Conditional"
//        case 45..<51:
//            return "Positive"
//        case 51..<57:
//            return "Negative"
        default:
            return nil
        }
    }
}
