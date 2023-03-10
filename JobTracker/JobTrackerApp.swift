//
//  JobTrackerApp.swift
//  JobTracker
//
//  Created by Mike on 2023-03-09.
//

import SwiftUI

@main
struct JobTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
