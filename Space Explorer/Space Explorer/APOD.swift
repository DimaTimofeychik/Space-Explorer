import Foundation
struct APOD: Identifiable, Codable {
    var id = UUID()
    let title : String
    let explanation: String
    let date: String
    let url: String
}
