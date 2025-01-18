import UIKit

final class APODCoordinator {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showAPODScreen()
    }
    
    private func showAPODScreen() {
        let networkManager = NetworkManager.instance
        let view = APODViewController()
        let viewModel = APODViewModel(networkManager: networkManager)
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)
    }
}
