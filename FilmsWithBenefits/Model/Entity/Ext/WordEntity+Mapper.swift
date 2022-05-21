//
//  WordEntity+Mapper.swift
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
            timestamp: Date(timeIntervalSince1970: timestamp))
    }
}
