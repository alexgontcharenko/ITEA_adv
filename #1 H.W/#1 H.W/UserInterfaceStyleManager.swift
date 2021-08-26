//
//  UserInterfaceStyleManager.swift
//  #1 H.W
//
//  Created by Steew on 18.07.2021.
//

import Foundation
import UIKit

protocol UserInterfaceStyleObserver: class {
    // 1
    func startObserving(_ userInterfaceStyleManager: inout UserInterfaceStyleManager)
    
    // 2
    func userInterfaceStyleManager(_ manager: UserInterfaceStyleManager, didChangeStyle style: UIUserInterfaceStyle)
}

struct WeakStyleObserver {
    weak var observer: UserInterfaceStyleObserver?
}

struct UserInterfaceStyleManager {
    
    static let userInterfaceStyleDarkModeOn = "userInterfaceStyleDarkModeOn";
    
    // 1
    private var observers = [ObjectIdentifier : WeakStyleObserver]()
    
    static var shared = UserInterfaceStyleManager()
    private init() { }
    
    private(set) var currentStyle: UIUserInterfaceStyle = UserDefaults.standard.bool(forKey: UserInterfaceStyleManager.userInterfaceStyleDarkModeOn) ? .dark : .light {
        // Property observer to trigger every time value is set to currentStyle
        didSet {
            if currentStyle != oldValue {
                // Trigger notification when currentStyle value changed
                styleDidChanged()
            }
        }
    }
}

// MARK:- Public functions
extension UserInterfaceStyleManager {
    // 2
    mutating func addObserver(_ observer: UserInterfaceStyleObserver) {
        let id = ObjectIdentifier(observer)
        // Create a weak reference observer and add to dictionary
        observers[id] = WeakStyleObserver(observer: observer)
    }
    
    // 3
    mutating func removeObserver(_ observer: UserInterfaceStyleObserver) {
        let id = ObjectIdentifier(observer)
        observers.removeValue(forKey: id)
    }
    
    mutating func updateUserInterfaceStyle(_ isDarkMode: Bool) {
        currentStyle = isDarkMode ? .dark : .light
    }
    
}

private extension UserInterfaceStyleManager {
    mutating func styleDidChanged() {
        for (id, weakObserver) in observers {
            // Clean up observer that no longer in memory
            guard let observer = weakObserver.observer else {
                observers.removeValue(forKey: id)
                continue
            }
            
            // Notify observer by triggering userInterfaceStyleManager(_:didChangeStyle:)
            observer.userInterfaceStyleManager(self, didChangeStyle: currentStyle)
        }
    }
}

extension UIViewController: UserInterfaceStyleObserver {
    
    func startObserving(_ userInterfaceStyleManager: inout UserInterfaceStyleManager) {
        // Add view controller as observer of UserInterfaceStyleManager
        userInterfaceStyleManager.addObserver(self)
        
        // Change view controller to desire style when start observing
        overrideUserInterfaceStyle = userInterfaceStyleManager.currentStyle
    }
    
    func userInterfaceStyleManager(_ manager: UserInterfaceStyleManager, didChangeStyle style: UIUserInterfaceStyle) {
        // Set user interface style of UIViewController
        overrideUserInterfaceStyle = style
        
        // Update status bar style
        setNeedsStatusBarAppearanceUpdate()
    }
}
