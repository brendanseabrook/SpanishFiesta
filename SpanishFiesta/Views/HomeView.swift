//
//  HomeView.swift
//  SpanishFiesta
//
//  Created by Brendan Seabrook on 2025-06-21.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State var path = NavigationPath()
    @Query var users: [User]
    
    enum Navigation: Hashable {
        case playMenu(user: User)
        case statsMenu(user: User)
    }
    
    @State var isShowingWelcome = false
    @State var isShowingSettings = false
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button {
                    path.append(Navigation.playMenu(user: users.first!))
                } label: {
                    Text("Start Session")
                }
                .buttonStyle(HomeMenuButton(color: .correctionBackground))
                .disabled(users.isEmpty)
            }
            .navigationDestination(for: Navigation.self) {
                switch $0 {
                case .playMenu(let user):
                    PlayView(user: user)
                case .statsMenu(let user):
                    Text("TODO")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Settings", systemImage: "gearshape") {
                        isShowingSettings.toggle()
                    }
                }
            }
        }
        .onAppear {
            if users.first == nil {
                isShowingWelcome.toggle()
            }
        }
        .sheet(isPresented: $isShowingWelcome) {
            WelcomeView(isShowing: $isShowingWelcome)
        }
        .sheet(isPresented: $isShowingSettings) {
            SettingsView(user: users.first!)
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: User.self, inMemory: true)
}

