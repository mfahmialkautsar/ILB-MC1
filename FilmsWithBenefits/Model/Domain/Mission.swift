//
//  Mission.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 19/05/22.
//

import Foundation

struct Mission {
    var id: UUID = UUID()
    var words: [Word] = []
    var filmNote: FilmNote
    var wordsTarget: WordsTargetEnum
    var reminder: Bool = false
    var finish: Bool = false
    var timestamp: Date = Date()
}
