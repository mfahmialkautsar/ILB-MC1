//
//  Film.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 19/05/22.
//

struct Film {
    var id: Int
    var title: String
    var type: FilmTypeEnum
    let posterPath: String?
    let popularity: Double?
    let overview: String?
    let backdropPath: String?
    let voteAverage: Double?
    let firstAirDate: String?
    let originCountry: [String]?
    let genreIDS: [Int]?
    let genres: [GenreResponse]?
    let voteCount: Int?
    let name, originalName: String?
    let adult: Bool?
    let releaseDate, originalTitle: String?
    let video: Bool?
    let profilePath: String?
    var season: Int?
    var episode: Int?
}
