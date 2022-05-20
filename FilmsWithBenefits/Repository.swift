//
//  Repository.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

class Repository {
    private let client = Client()
    func fetchFilmsByTitle(_ title: String, completion: @escaping (RequestResult<[Film], ErrorResponse>) -> Void) {
        client.search(title) { res in
            switch res {
            case let .success(result):
                completion(.success(result.results.filter { $0.mediaType != .person }.compactMap { $0.toFilm() }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchMovieById(_ id: Int, completion: @escaping (RequestResult<Film, ErrorResponse>) -> Void) {
        client.getMovieById(id) { res in
            switch res {
            case let .success(result):
                completion(.success(result.toFilm()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func fetchTvById(_ id: Int, completion: @escaping (RequestResult<Film, ErrorResponse>) -> Void) {
        client.getTvById(id) { res in
            switch res {
            case let .success(result):
                completion(.success(result.toFilm()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
