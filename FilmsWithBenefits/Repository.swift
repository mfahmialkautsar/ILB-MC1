//
//  Repository.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import CoreData
import Foundation

class Repository {
    private let client = Client()
    private let persistenceController = PersistenceController.shared
    private let context = PersistenceController.shared.container.viewContext
    
    private func getMission(with uuid: UUID) -> MissionEntity? {
        let request = MissionEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(MissionEntity.uuid), uuid as CVarArg)
        guard let missions = try? context.fetch(request) else { return nil }
        return missions.first
    }
    
    private func getWord(with uuid: UUID) -> WordEntity? {
        let request = WordEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(WordEntity.uuid), uuid as CVarArg)
        guard let words = try? context.fetch(request) else { return nil }
        return words.first
    }
}

extension Repository {
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

    func addMission(mission: Mission) {
        _ = mission.toEntity(context: context)
        do {
            try context.save()
        } catch {
            print(error)
        }
    }

    func getMissions() -> [Mission] {
        let missionEntity: [MissionEntity] = (try? context.fetch(MissionEntity.fetchRequest())) ?? []
        return missionEntity.map { $0.toDomain() }
    }

    func addWord(missionId: UUID, word: Word) {
        let word = word.toEntity(context: context)
        let mission = getMission(with: missionId)
        guard let mission = mission else { return }
        word.mission = mission
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func deleteWord(wordId: UUID) {
        guard let word = getWord(with: wordId) else { return }
        context.delete(word)
    }
    
    func getUnfinishedMissions() -> [Mission] {
        let request = MissionEntity.fetchRequest()
        request.predicate = NSPredicate(format: "%K == %@", #keyPath(MissionEntity.finish), NSNumber(value: false))
        guard let missions = try? context.fetch(request) else { return [] }
        print(missions)
        return missions.map { $0.toDomain() }
    }
    
    func finishMission(missionId: UUID) {
        let mission = getMission(with: missionId)
        guard let mission = mission else { return }
        mission.finish = true
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}
