//
//  User.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import SwiftData
import Foundation
import AVFAudio

@Model
final class User {
    var confindences: [UUID: Double]
    
    static var suggestedGoals = [10, 20, 50, 100]
    var dailyGoal: Int
    var tuVosSetting: TuVosSetting
    var playback = PlaybackSettings.none
    var voiceModule = VoiceSetting.latinAmericanSpanish
    
    init(dailyGoal: Int, tuVosSetting: TuVosSetting, confindences: [UUID : Double]) {
        self.dailyGoal = dailyGoal
        self.tuVosSetting = tuVosSetting
        self.confindences = confindences
    }
    
    var nextSentence: Sentence {
        return try! WordLibrary.current.verbs.randomElement()!.value.sentences.randomElement()!
    }
    
    func getAudio(input: String, playback: PlaybackSettings? = nil) -> AVSpeechUtterance? {
        let toSay: String
        switch playback ?? self.playback { //Fallback to user settings on nil
        case .none:
            return nil
        case .justSyllibles:
            toSay = input.syllabify().joined(separator: "...")
        case .justWord:
            toSay = input
        case .both:
            toSay = input.syllabify().joined(separator: "...") + ".... " + input
        }
        
        let utterance = AVSpeechUtterance(string: toSay)
        utterance.rate = 0.2
        utterance.pitchMultiplier = 0.8
        utterance.postUtteranceDelay = 0.2
        utterance.volume = 0.8
        utterance.voice = AVSpeechSynthesisVoice(language: voiceModule.rawValue)
        
        return utterance
    }
}
