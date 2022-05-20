//
//  ErrorResponse.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

enum ErrorResponse: Error {
    case error(Int, String)

    var reason: (code: Int, description: String) {
        switch self {
        case let .error(errorCode, description):
            return (errorCode, description)
        }
    }
}
