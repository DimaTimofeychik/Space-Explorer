import Foundation
import Alamofire

class NetworkManager {
    static let instance = NetworkManager()
    
    private let baseURL = "https://api.nasa.gov"
    private let apiKey = "g6t36YVmzUlCXyyxocMQsnGGcdEw7rAZjDUHyb3V"
    
    private init() {}
    
    // Fetch Astronomy Picture of the Day (APOD)
    func fetchAPOD(completion: @escaping (Result<APOD, AFError>) -> Void) {
        let url = "\(baseURL)/planetary/apod?api_key=\(apiKey)"
        AF.request(url).responseDecodable(of: APOD.self) { response in
            completion(response.result)
        }
    }
    
    // Fetch photos from Mars rover
    func fetchMarsRoverPhotos(roverName: String, sol: Int, completion: @escaping (Result<[MarsRoverPhoto], AFError>) -> Void) {
        let url = "\(baseURL)/mars-photos/api/v1/rovers/\(roverName)/photos?sol=\(sol)&api_key=\(apiKey)"
        AF.request(url).responseDecodable(of: MarsRoverPhotosResponse.self) { response in
            completion(response.result.map { $0.photos })
        }
    }
    
    // Fetch Near Earth Objects (NEOs)
    func fetchNEOs(startDate: String, endDate: String, completion: @escaping (Result<NeoWsResponse, AFError>) -> Void) {
        let url = "\(baseURL)/neo/rest/v1/feed?start_date=\(startDate)&end_date=\(endDate)&api_key=\(apiKey)"
        AF.request(url).responseDecodable(of: NeoWsResponse.self) { response in
            completion(response.result)
        }
    }
}

// Models for the APOD API response
struct APOD: Codable {
    let title: String
    let explanation: String
    let url: String
    let hdUrl: String?
    let date: String
    let mediaType: String
    
    enum CodingKeys: String, CodingKey {
        case title, explanation, url
        case hdUrl = "hdurl"
        case date
        case mediaType = "media_type"
    }
}

// Models for the Mars Rover Photos API response
struct MarsRoverPhotosResponse: Codable {
    let photos: [MarsRoverPhoto]
}

struct MarsRoverPhoto: Codable {
    let id: Int
    let imgSrc: String
    let earthDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case imgSrc = "img_src"
        case earthDate = "earth_date"
    }
}

// Models for the Asteroids NeoWs API response
struct NeoWsResponse: Codable {
    let nearEarthObjects: [String: [NearEarthObject]]
    
    enum CodingKeys: String, CodingKey {
        case nearEarthObjects = "near_earth_objects"
    }
}

struct NearEarthObject: Codable {
    let id: String
    let name: String
    let isPotentiallyHazardousAsteroid: Bool
    // Add other fields as needed
}
