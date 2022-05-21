//
//  MediaTypeResponse+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension MediaTypeResponse {
    func toFilmTypeEnum() -> FilmTypeEnum? {
        switch self {
        case .movie:
            return FilmTypeEnum.movie
        case .tv:
            return FilmTypeEnum.tv
        default:
            return nil
        }
    }
}
