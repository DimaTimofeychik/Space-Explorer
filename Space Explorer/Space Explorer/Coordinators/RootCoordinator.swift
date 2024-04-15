import UIKit

final class RootCoordinator {
    // MARK: - Private Properties
    private let window: UIWindow
    private let initialNavigationController = UINavigationController()
    
    private var welcomeScrCoordinator: WelcomeScreenCoordinator?
    private var apodScreCoordinator: APODCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    // MARK: - Methods
    func start() {
        welcomeScrCoordinator = WelcomeScreenCoordinator(navigationController: initialNavigationController)
        apodScreCoordinator = APODCoordinator(navigationController: initialNavigationController)
        
        if let coordinator = welcomeScrCoordinator {
            coordinator.start()
        }
        
        window.rootViewController = initialNavigationController
        window.makeKeyAndVisible()
    }
}
