//
//  Client.swift
//  FilmsWithBenefits
//
//  Created by Muhamad Fahmi Al Kautsar on 20/05/22.
//

import Foundation

final class Client {
    private var mainTask: URLSessionDataTask?
    private var detailTask: URLSessionDataTask?

    private func session(timeOut: TimeInterval = 60) -> URLSession {
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        config.allowsCellularAccess = true
        config.timeoutIntervalForRequest = timeOut
        config.timeoutIntervalForResource = timeOut
        return URLSession(configuration: config)
    }

    func search(_ keyword: String, completion: @escaping (NetworkResult<Search, ErrorResponse>) -> Void) {
        let queue = DispatchQueue(label: "searchFilms", qos: .userInteractive)
        let urlRequest = URLRequest(url: URL(string: Endpoints.Gets.byName(keyword).url)!)
        queue.async {
            self.mainTask = self.session().dataTask(with: urlRequest) { data, response, error in
                if let error = error as NSError? {
                    switch error.code {
                    case -999:
                        return
                    default:
                        completion(NetworkResult.failure(ErrorResponse.error(error.code, error.localizedDescription)))
                        return
                    }
                }

                guard let response = response as? HTTPURLResponse else {
                    completion(NetworkResult.failure(ErrorResponse.error(0, "Response Error")))
                    return
                }

                switch response.statusCode {
                case 200 ... 299:
                    guard let data = data, let films = try? JSONDecoder().decode(Search.self, from: data) else {
                        completion(NetworkResult.failure(ErrorResponse.error(response.statusCode, response.description)))
                        return
                    }

                    completion(NetworkResult.success(films))
                default:
                    completion(NetworkResult.failure(ErrorResponse.error(response.statusCode, response.description)))
                }
            }
            self.mainTask?.resume()
        }
    }
}
