//
//  WordDao+Mapper.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

extension WordDao {
    func toDomain() -> Word {
        return Word(
            id: Int(id),
            content: content ?? "",
            translation: translation,
            type: (type != nil) ? WordTypeEnum(rawValue: Int(truncating: type!)) : nil)
    }
}
