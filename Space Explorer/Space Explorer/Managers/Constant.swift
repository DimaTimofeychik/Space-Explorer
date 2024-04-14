import Foundation

class Constant {
    static var apiKey: String {
        return "g6t36YVmzUlCXyyxocMQsnGGcdEw7rAZjDUHyb3V"
    }
    
    static var baseUrlString: String {
        return "https://api.nasa.gov/planetary/apod?"
    }
    
    static var url: URL {
        guard let url = URL(string: "\(baseUrlString)api_key=\(apiKey)&count=25") else { //25 рандомных фоток из апи
            fatalError()
        }
                return url
    }
    
    static var session: URLSession {
        let session = URLSession(configuration: .default)
        return session
    }
    static var request: URLRequest {
        let req = URLRequest(url: url)
        return req
    }
    
    static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
