//
//  MovieResponse+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension MovieResponse {
    func toFilm() -> Film {
        return Film(id: id,
                    title: title ?? "",
                    type: .movie,
                    posterPath: posterPath,
                    popularity: popularity,
                    overview: overview,
                    backdropPath: backdropPath,
                    voteAverage: voteAverage,
                    firstAirDate: nil,
                    originCountry: nil,
                    genreIDS: nil,
                    genres: genres,
                    voteCount: voteCount,
                    name: nil,
                    originalName: nil,
                    adult: adult,
                    releaseDate: releaseDate,
                    originalTitle: originalTitle,
                    video: video,
                    profilePath: nil
        )
    }
}
