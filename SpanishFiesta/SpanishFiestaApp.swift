//
//  SpanishFiestaApp.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import SwiftUI
import SwiftData

@main
struct SpanishFiestaApp: App {
    init() {
        try? WordLibrary.load()
    }
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(sharedModelContainer)
    }
}
