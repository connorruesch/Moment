//
//  MomentApp.swift
//  Moment
//
//  Created by Connor Ruesch on 4/19/25.
//

import SwiftUI
import SwiftData

@main
struct MomentApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Entry.self)
    }
}
