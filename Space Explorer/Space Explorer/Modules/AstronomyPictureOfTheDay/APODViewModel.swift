import Foundation

class APODViewModel {
    var networkManager: NetworkManager
    var didUpdateAPOD: ((APOD) -> Void)?
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func fetchAPODData() {
        networkManager.fetchAPOD { [weak self] result in
            switch result {
            case .success(let apod):
                self?.didUpdateAPOD?(apod)
            case .failure(let error):
                print("Error fetching APOD: \(error.localizedDescription)")
            }
        }
    }
}
