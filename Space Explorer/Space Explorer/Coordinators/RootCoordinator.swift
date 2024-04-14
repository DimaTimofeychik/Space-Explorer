import UIKit

final class RootCoordinator {
    // MARK: - Private Properties
    private let window: UIWindow
    private let initialNavigationController = UINavigationController()
    
    private var welcomeScrCoordinator: WelcomeScreenCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    // MARK: - Methods
    func start() {
        welcomeScrCoordinator = WelcomeScreenCoordinator(navigationController: initialNavigationController)
        
        if let coordinator = welcomeScrCoordinator {
            coordinator.start()
        }
        
        window.rootViewController = initialNavigationController
        window.makeKeyAndVisible()
    }
}
