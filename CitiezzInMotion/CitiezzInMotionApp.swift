//
//  CitiezzInMotionApp.swift
//  CitiezzInMotion
//
//  Created by Carlos Mario Araujo on 3/01/25.
//

import SwiftUI

@main
struct CitiezzInMotionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
