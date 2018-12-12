
import Foundation

extension LGButton {
    func applyCapoSettings(title: String? = nil, loadingTitle: String = "Загрузка...") {
        if let title = title {
            self.titleString = title
        }
        self.loadingString = loadingTitle
        cornerRadius = 3
        if isEnabled {
            isEnabled = true    
        }
    }
    
    func applyLoginSettings(title: String? = nil, loadingTitle: String = "Загрузка...") {
        if let title = title {
            self.titleString = title
        }
        self.loadingString = loadingTitle
        cornerRadius = 5
        if isEnabled {
            isEnabled = true
        }
    }
}
