//
//  Mission+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 21/05/22.
//

import CoreData

extension Mission {
    func toEntity(context: NSManagedObjectContext) -> MissionEntity {
        let mission = MissionEntity(context: context)
        mission.uuid = id
        mission.words = NSSet(array: words.map { $0.toEntity(context: context) })
        mission.filmNote = filmNote.toEntity(context: context)
        mission.wordsTarget = wordsTarget.rawValue
        mission.reminder = reminder
        mission.finish = finish
        mission.timestamp = timestamp.timeIntervalSince1970
        return mission
    }
}
