//
//  MissionDao+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

extension MissionDao {
    func toDomain() -> Mission {
        return Mission(
            id: Int(id),
            words: (words as? Set<WordDao>)?.sorted { $0.timestamp > $1.timestamp }.map { $0.toDomain() } ?? [],
            filmId: Int(filmId),
            timestamp: Date(timeIntervalSince1970: timestamp))
    }
}
