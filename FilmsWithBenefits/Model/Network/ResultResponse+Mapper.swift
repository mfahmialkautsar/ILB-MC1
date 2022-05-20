//
//  ResultResponse+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension ResultResponse {
    func toFilm() -> Film? {
        guard let mediaType = mediaType, let filmTypeEnum = mediaType.toFilmTypeEnum() else { return nil }
        return Film(id: id,
                    title: title ?? "",
                    type: filmTypeEnum,
                    posterPath: posterPath,
                    popularity: popularity,
                    overview: overview,
                    backdropPath: backdropPath,
                    voteAverage: voteAverage,
                    firstAirDate: firstAirDate,
                    originCountry: originCountry,
                    genreIDS: genreIDS,
                    genres: nil,
                    voteCount: voteCount,
                    name: name,
                    originalName: originalName,
                    adult: adult,
                    releaseDate: releaseDate,
                    originalTitle: originalTitle,
                    video: video,
                    profilePath: profilePath
        )
    }
}
