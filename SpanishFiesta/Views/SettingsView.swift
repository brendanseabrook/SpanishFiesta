//
//  SettingsView.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-25.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var user: User
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Audio Playback", selection: $user.playback) {
                    ForEach(PlaybackSettings.allCases, id:\.self) {
                        Text($0.label)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: $user.playback.wrappedValue) {
                    try? modelContext.save()
                }
                
                Text("Play audio enunciating the answer")
                    .modifier(FormCaption())
                
                Spacer()
            }
            .navigationTitle("Settings")
        }
        .padding(.horizontal, 20)
    }
}
