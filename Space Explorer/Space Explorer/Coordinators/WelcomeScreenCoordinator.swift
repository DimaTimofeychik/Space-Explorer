import UIKit

final class WelcomeScreenCoordinator {
    
    let navigationController: UINavigationController
    
    private var settingsCoordinator: SettingsCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        settingsCoordinator = SettingsCoordinator(navigationController: self.navigationController)
    }
    
    func start() {
        showWelcomeScreen()
    }
    
    private func showWelcomeScreen() {
        let view = WelcomeScreenViewController()
        let viewModel = WelcomeScreenViewModel()
        view.viewModel = viewModel
        navigationController.setViewControllers([view], animated: true)
        
        viewModel.showSettingsPage = { [weak self] in
            self?.settingsCoordinator?.start()
        }
    }
}
