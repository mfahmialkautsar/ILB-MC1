//
//  FilmsWithBenefitsApp.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 19/05/22.
//

import SwiftUI

@main
struct FilmsWithBenefitsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
