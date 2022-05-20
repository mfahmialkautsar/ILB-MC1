//
//  NetworkResult.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

enum NetworkResult<T, U: Error> {
    case success(T)
    case failure(U)
}
