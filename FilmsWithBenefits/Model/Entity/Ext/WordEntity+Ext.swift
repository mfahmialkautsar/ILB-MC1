//
//  WordEntity+Ext.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

extension WordEntity {
    func toDomain() -> Word {
        return Word(
            id: uuid ?? UUID(),
            content: content ?? "",
            translation: translation,
            type: (type != nil) ? WordTypeEnum(rawValue: Int(truncating: type!)) : nil,
            sentence: sentence,
            timestamp: Date(timeIntervalSince1970: timestamp))
    }

    func update(word: Word) {
        content = word.content
        translation = word.translation
        type = word.type?.rawValue as NSNumber?
        sentence = word.sentence
    }
}
