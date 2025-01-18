import Foundation
import Combine

final class WelcomeScreenViewModel {
    // MARK: - Public properties
    var showSettingsPage: (() -> Void)?
    
    
    // MARK: - Methods
    
    
    func settingsButtonTapped() {
        showSettingsPage?()
    }
}
