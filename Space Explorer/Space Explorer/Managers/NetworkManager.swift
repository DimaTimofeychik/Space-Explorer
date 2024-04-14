import Alamofire
import Foundation

class NetworkManager: NSCopying {
    static let instance = NetworkManager()
    
    private let url = "https://www.nbrb.by/api/exrates/rates?periodicity=0"
    
    private init() { }
    
    
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NetworkManager.instance
    }
}
