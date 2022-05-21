//
//  TvResponse+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension TvResponse {
    func toFilm() -> Film {
        return Film(id: id,
                    title: name ?? "",
                    type: .tv,
                    posterPath: posterPath,
                    popularity: popularity,
                    overview: overview,
                    backdropPath: backdropPath,
                    voteAverage: voteAverage,
                    firstAirDate: firstAirDate,
                    originCountry: originCountry,
                    genreIDS: nil,
                    genres: genres,
                    voteCount: voteCount,
                    name: name,
                    originalName: originalName,
                    adult: nil,
                    releaseDate: firstAirDate,
                    originalTitle: nil,
                    video: nil,
                    profilePath: nil
        )
    }
}
