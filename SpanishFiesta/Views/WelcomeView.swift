//
//  WelcomeView.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-24.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isShowing: Bool
    @State var goal: Int = User.suggestedGoals.first!
    @State var progressStyle: ProgressStyle = .locked
    @State var isNeedingVosotros: Bool = false
    @State var tuVosSetting: TuVosSetting = .justTu
    
    enum ProgressStyle: String, CaseIterable {
        case locked = "Beginner"
        case unlocked = "Advanced"
        
        var description: String {
            switch self {
            case .locked:
                "Start with infinitives for a small pool of words then slowly unlock more moods/tenses."
            case .unlocked:
                "All words, moods tenses are unlocked from the start. Recommended for learnings who already have a good foundation in Spanish."
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Welcome to Spanish Fiesta!")
                .font(.title)
                .padding(.top, 30)

            VStack {
                Picker("How many flashcards?", selection: $goal) {
                    ForEach(User.suggestedGoals, id: \.self) { value in
                        Text("\(value)")
                    }
                }
                .pickerStyle(.segmented)
                Text("It's important to set goals. How many flashcards do you want to do each day you use this app?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            
            VStack {
                Picker("Mode", selection: $progressStyle) {
                    ForEach(ProgressStyle.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                Text("You can either use the app to progressively learn new words, moods and tenses. Or you can unlock all words, moods and tenses from the start.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            VStack {
                Picker("Tu and/or Vos", selection: $tuVosSetting) {
                    ForEach(TuVosSetting.allCases, id: \.self) {
                        Text($0.label)
                    }
                    .pickerStyle(.segmented)
                }
                .pickerStyle(.segmented)
                
                Text("Do you want to learn Tu, Vos or both?.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                HStack {
                    VStack {
                        Text("Mostly Tú:")
                        Text("Spain")
                        Text("Mexico")
                        Text("Peru")
                        Text("Caribbean")
                    }
                    Spacer()
                    VStack {
                        Text("Mostly Vos:")
                        Text("Argentina")
                        Text("Uruguay")
                        Text("Nicaragua")
                        Text("Costa Rica")
                    }
                    Spacer()
                    VStack {
                        Text("Uses Both:")
                        Text("Colombia")
                        Text("Venezuela")
                        Text("Ecuador")
                        Text("Bolivia")
                    }
                }
                .frame(maxWidth: .infinity)
                .font(.caption)
                .foregroundStyle(.secondary)
            }
            
            VStack {
                Picker("Vosotros", selection: $isNeedingVosotros) {
                    Text("No").tag(false)
                    Text("Yes").tag(true)
                }
                .pickerStyle(.segmented)
                
                Text("Do you want to learn Vosotros? (Vosotros is only used in Spain)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 20)

        Spacer()
        
        Button {
            modelContext.insert(User(dailyGoal: goal, tuVosSetting: tuVosSetting, confindences: [:]))
            try? modelContext.save()
            isShowing.toggle()
        } label: {
            Text("Start")
        }
        .buttonStyle(HomeMenuButton(color: .correctionBackground))
    }
}
