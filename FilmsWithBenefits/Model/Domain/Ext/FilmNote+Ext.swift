//
//  FilmNote+Ext.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 21/05/22.
//

import CoreData

extension FilmNote {
    func toEntity(context: NSManagedObjectContext) -> FilmNoteEntity {
        let filmNote = FilmNoteEntity(context: context)
        filmNote.uid = Int64(id)
        filmNote.title = title
        filmNote.episode = episode as NSNumber?
        filmNote.season = season as NSNumber?
        filmNote.type = Int16(type.rawValue)
        return filmNote
    }
}
