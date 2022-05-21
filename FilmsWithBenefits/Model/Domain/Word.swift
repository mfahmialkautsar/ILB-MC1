//
//  Word.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 19/05/22.
//

import Foundation

struct Word {
    var id: UUID = UUID()
    var content: String
    var translation: String? = nil
    var type: WordTypeEnum?
    var sentence: String? = nil
    var timestamp: Date = Date()
}
