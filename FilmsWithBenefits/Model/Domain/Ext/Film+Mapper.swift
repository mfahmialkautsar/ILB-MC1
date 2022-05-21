//
//  Film+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 21/05/22.
//

extension Film {
    func toFilmNote(season: Int? = nil, episode: Int? = nil) -> FilmNote {
        return FilmNote(
            id: id,
            title: title,
            type: type,
            season: season,
            episode: episode)
    }
}
