//
//  PlayView.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import AVFoundation
import SwiftUI

struct PlayView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    init(user: User) {
        self.user = user
        self.subjectSentence = user.nextSentence
    }
    
    let user: User
    
    @State var isShowingSolution = false
    @State var subjectSentence: Sentence
    @State var isPlayingSound = false
    @State var hintIndex = 0
    let synthesizer = AVSpeechSynthesizer()

    init(user: User, isShowingSolution: Bool = false, subjectSentence: Sentence) {
        self.user = user
        self.subjectSentence = user.nextSentence
    }
    
    var body: some View {
        VStack {
            Text(subjectSentence.en)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 18))
                .foregroundStyle(Color.white)
            
            Divider()
                .frame(height: 2)
                .background(Color.lineBlue)
            
            Text(isShowingSolution ? subjectSentence.highlighted : subjectSentence.blanked)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(Color.white)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("End", systemImage: "xmark") {
                    dismiss()
                }
            }
        }
        .modifier(Tile(Color.questionBackground))
        
        
        
        if subjectSentence.inflectionIndex.isVosotros {
            Text("Use Vosotros!")
                .modifier(Tile(.red))
        }
        
        if isShowingSolution || hintIndex > 0 {
            VStack(spacing: 10) {
                if isShowingSolution || subjectSentence.hints[0..<hintIndex].contains(where: { $0.isVerbHint }) {
                    HStack {
                        Text("Verb")
                        Spacer()
                        Text(subjectSentence.infinitive.capitalized)
                        Button("", systemImage: "questionmark.circle.dashed") {
                            //isShowingVerbHelp.toggle()
                        }
                    }
//                    .sheet(isPresented: $isShowingVerbHelp) {
//                        Text("Verb Help")
//                    }
                }

                if isShowingSolution || subjectSentence.hints[0..<hintIndex].contains(where: { $0.isMoodFormHint }) {
                    HStack {
                        Text(subjectSentence.inflectionIndex.moodFormDescription)
                        Spacer()
                        Text(subjectSentence.inflectionIndex.moodFormValue)
                        Button("", systemImage: "questionmark.circle.dashed") {
                            //isShowingVerbHelp.toggle()
                        }
                    }
                }
                
                if isShowingSolution || subjectSentence.hints [0..<hintIndex].contains(where: { $0.isTenseHint }) {
                    if let tenseLebel = subjectSentence.inflectionIndex.tenseLabel, let tenseDescription = subjectSentence.inflectionIndex.tenseDescription {
                        HStack {
                            Text(tenseLebel)
                            Spacer()
                            Text(tenseDescription)
                            Button("", systemImage: "questionmark.circle.dashed") {
                                //isShowingVerbHelp.toggle()
                            }
                        }
                    }
                }

                if isShowingSolution || subjectSentence.hints[0..<hintIndex].contains(where: { $0.isSubjectHint }) {
                    if let subjectDescription = subjectSentence.inflectionIndex.subjectDescription {
                        HStack {
                            Text("Subject")
                            Spacer()
                            Text(subjectDescription)
                            Button("", systemImage: "questionmark.circle.dashed") {
                                //isShowingVerbHelp.toggle()
                            }
                        }
                    }
                }
                
                if isShowingSolution {
                    HStack {
                        Text("Syllables")
                        Spacer()
                        Text(subjectSentence.inflection.syllabify().joined(separator: "-"))
                        if let audio = user.getAudio(input: subjectSentence.inflection, playback: .both) { //Should be always
                            Button("", systemImage: "play.circle") {
                                synthesizer.speak(audio)
                            }
                        }
                        
                    }
                }
            }
            .padding(20)
            .background {
                RoundedRectangle(cornerRadius: 5)
                    .fill(Color.correctionBackground)
            }
        }
        
        Spacer()
        
        
        if isShowingSolution {
            HStack(spacing: 0) {
                Button {
//                    _ = user.awardEffort(index: nextSentence.inflectionIndex, wasCorrect: false)
                    withAnimation {
                        //reset()
                    }
                } label: {
                    Image(systemName: "hand.thumbsdown")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                }
                .buttonStyle(RaisedButton(color: .negativeBackground))
                .padding(.top, 16)

                Button {
//                    _ = user.awardEffort(index: nextSentence.inflectionIndex, wasCorrect: true)
                    withAnimation {
                        //reset()
                    }
                } label: {
                    Image(systemName: "hand.thumbsup")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                }
                .buttonStyle(RaisedButton(color: .promoteBackground))
                .padding(.top, 16)
            }
        } else {
            if hintIndex < subjectSentence.hints.count {
                Button {
                    if hintIndex < subjectSentence.hints.count {
                        withAnimation {
                            hintIndex += 1
                        }
                    }
                } label: {
                    Text("Hint".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20, weight: .bold))
                }
                .buttonStyle(RaisedButton(color: .hintBackground))
            }
            
            Button {
                withAnimation {
                    //user.lastAccessed = .now
                    isShowingSolution = true
                    if let audio = user.getAudio(input: subjectSentence.inflection) {
                        synthesizer.speak(audio)
                    }
                }
            } label: {
                Text("Reveal".uppercased())
                    .foregroundStyle(Color.white)
                    .font(.system(size: 24, weight: .heavy))
            }
            .buttonStyle(RaisedButton(color: .constant(.questionBackground)))
        }
    }
}

