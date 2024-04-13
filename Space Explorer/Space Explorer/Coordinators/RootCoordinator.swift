import UIKit

final class RootCoordinator {
    // MARK: - Private Properties
    private let window: UIWindow
    private let initialNavigationController = UINavigationController()
    
    init(window: UIWindow) {
        self.window = window
    }
    // MARK: - Methods
    func start() {
        window.rootViewController = initialNavigationController
        window.makeKeyAndVisible()
    }
}
