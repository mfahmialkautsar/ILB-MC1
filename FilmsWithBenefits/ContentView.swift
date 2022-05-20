//
//  ContentView.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 19/05/22.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \MissionDao.timestamp, ascending: true)],
        animation: .default)
    private var missionsDao: FetchedResults<MissionDao>
    private var missions: [Mission] {
        return missionsDao.map { $0.toDomain() }
    }

    private let client = Client()

    var body: some View {
        NavigationView {
            List {
                ForEach(missions, id: \.id) { mission in
                    NavigationLink {
                        Text("MissionDao at \(mission.timestamp, formatter: itemFormatter)")
                        ForEach(mission.words, id: \.id) { word in
                            Text("Word = \(word.content)")
                        }
                    } label: {
                        Text(mission.timestamp, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add MissionDao", systemImage: "plus")
                    }
                }
            }
            Text("Select an missionDao")
        }
        .onAppear {
            client.search("alone") { result in
                switch result {
                case let .success(response):
                    print(response)
                case let .failure(err):
                    print("ERROR Fetch", err.localizedDescription)
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newMission = MissionDao(context: viewContext)
            newMission.timestamp = Date().timeIntervalSince1970

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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { missionsDao[$0] }.forEach(viewContext.delete)

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
