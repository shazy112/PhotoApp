import Foundation

struct Album: Codable {
    let photos: [Photos]
    
    enum CodingKeys: String, CodingKey {
        case photos = "hits"
    }
}

// MARK: - Hit
struct Photos: Codable {
    let webformatURL: String?
    var photoUrl: URL? {
        guard let url = webformatURL else { return nil }
        return URL(string: url)
    }
    
    enum CodingKeys: String, CodingKey {
        case webformatURL
    }
}
