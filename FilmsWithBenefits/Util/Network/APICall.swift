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
}

fileprivate protocol Endpoint {
    var url: URL { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case byName(String)
        case movieById(Int)
        case tvById(Int)

        public var url: URL {
            var urlString = API.baseUrl
            var queryItems: [URLQueryItem] = [URLQueryItem(name: "api_key", value: apiKey)]
            switch self {
            case let .byName(query):
                queryItems.append(URLQueryItem(name: "query", value: query))
                urlString = "\(API.baseUrl)search/multi"
            case let .movieById(id):
                urlString = "\(API.baseUrl)movie/\(id)"
            case let .tvById(id):
                urlString = "\(API.baseUrl)tv/\(id)"
            }
            var component = URLComponents(url: URL(string: urlString)!, resolvingAgainstBaseURL: false)
            component?.queryItems = queryItems
            return component!.url!
        }
    }
}
