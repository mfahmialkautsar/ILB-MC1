//
//  MissionEntity+Ext.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import CoreData
import Foundation

extension MissionEntity {
    func toDomain() -> Mission {
        return Mission(
            id: uuid ?? UUID(),
            words: (words as? Set<WordEntity>)?.sorted { $0.timestamp > $1.timestamp }.map { $0.toDomain() } ?? [],
            filmNote: filmNote!.toDomain(),
            wordsTarget: WordsTargetEnum(rawValue: wordsTarget!)!,
            reminder: reminder,
            finish: finish,
            timestamp: Date(timeIntervalSince1970: timestamp))
    }

    func save(mission: Mission) {
        uuid = UUID()
        filmNote = mission.filmNote.toEntity(context: managedObjectContext ?? PersistenceController.shared.container.viewContext)
        words = NSSet(array: mission.words)
        wordsTarget = mission.wordsTarget.rawValue
        reminder = mission.reminder
        finish = mission.finish
        timestamp = mission.timestamp.timeIntervalSince1970
    }
}
