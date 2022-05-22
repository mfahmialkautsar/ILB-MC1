//
//  Word+Ext.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 21/05/22.
//

import CoreData

extension Word {
    func toEntity(context: NSManagedObjectContext) -> WordEntity {
        let word = WordEntity(context: context)
        word.uuid = id
        word.content = content
        word.translation = translation
        word.type = type?.rawValue as NSNumber?
        word.sentence = sentence
        word.timestamp = timestamp.timeIntervalSince1970
        return word
    }
}
