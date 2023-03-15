//
//  Applications.swift
//  JobTracker
//
//  Created by Mike on 2023-03-14.
//

import SwiftUI

struct Applications: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Job.date, ascending: false)],
        animation: .default)
    
    private var items: FetchedResults<Job>
    @State private var selectedItem: Job? = nil

    var body: some View {
        List(items, id: \.self, selection: $selectedItem) { item in
            NavigationLink(destination: ApplicationDetailView(application: item), tag: item, selection: $selectedItem) {
                Text(item.date?.description ?? "no title")
            }
           
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 200)
        .navigationTitle("Job Applications")
        .toolbar {
#if os(iOS)
//            ToolbarItem(placement: .navigationBarTrailing) {
//                EditButton()
//            }
#endif
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Job(context: viewContext)
            newItem.date = Date()

          
            do {
                try viewContext.save()
                selectedItem = newItem
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct Applications_Previews: PreviewProvider {
    static var previews: some View {
        Applications()
    }
}
