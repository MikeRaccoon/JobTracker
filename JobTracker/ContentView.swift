//
//  ContentView.swift
//  JobTracker
//
//  Created by Mike on 2023-03-09.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationView {
            TabView {
                Applications()
                    .tabItem {
                        Label("Applications", systemImage: "list.dash")
                    }
                    .environment(\.managedObjectContext, persistence.container.viewContext)
                Interviews()
                    .tabItem {
                        Label("Interviews", systemImage: "list.dash")
                    }
                    .environment(\.managedObjectContext, persistence.container.viewContext)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.container.viewContext)
//    }
//}
