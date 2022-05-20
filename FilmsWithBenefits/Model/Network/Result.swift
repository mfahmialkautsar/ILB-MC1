import Foundation

struct Result: Codable {
    let posterPath: String?
    let popularity: Double?
    let id: Int
    let overview: String?
    let backdropPath: String?
    let voteAverage: Double?
    let mediaType: MediaType?
    let firstAirDate: String?
    let originCountry: [String]?
    let genreIDS: [Int]?
//    let originalLanguage: OriginalLanguage?
    let voteCount: Int?
    let name, originalName: String?
    let adult: Bool?
    let releaseDate, originalTitle, title: String?
    let video: Bool?
    let profilePath: String?
    let knownFor: [Result]?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case popularity, id, overview
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case mediaType = "media_type"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIDS = "genre_ids"
//        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case adult
        case releaseDate = "release_date"
        case originalTitle = "original_title"
        case title, video
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}
