import Foundation

struct SearchResponse: Codable {
    let page: Int?
    let results: [ResultResponse]
    let totalResults, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
