//
//  FilmNoteEntity+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension FilmNoteEntity {
    func toDomain() -> FilmNote {
        return FilmNote(id: Int(uid),
                        title: title ?? "",
                        type: FilmTypeEnum(rawValue: Int(type))!,
                        season: (season != nil) ? Int(truncating: season!) : nil,
                        episode: (episode != nil) ? Int(truncating: episode!) : nil
        )
    }
}
