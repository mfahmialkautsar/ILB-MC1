//
//  UrlAddress.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

fileprivate var apiKey: String = ProcessInfo.processInfo.environment["API_KEY"] ?? ""

fileprivate struct API {
    static let baseUrl = "https://api.themoviedb.org/3/"
    static var key: String {
        return "api_key=\(apiKey)"
    }
}

fileprivate protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case byName(String)
        case movieById(Int)
        case tvById(Int)

        public var url: String {
            switch self {
            case let .byName(query):
                return "\(API.baseUrl)search/multi?\(API.key)&query=\(query)"
            case let .movieById(id):
                return "\(API.baseUrl)movie/\(id)?\(API.key)"
            case let .tvById(id):
                return "\(API.baseUrl)tv/\(id)?\(API.key)"
            }
        }
    }
}
