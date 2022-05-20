//
//  RequestResult.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

enum RequestResult<T, U: Error> {
    case success(T)
    case failure(U)
}
