//
//  AppState.swift
//  SegmentedControl
//
//  Created by Гена Книжник on 26.01.2020.
//  Copyright © 2020 exey. All rights reserved.
//

import UIKit

class AppState {
    
    static var shared = AppState()
    
    var mainWindow: UIWindow?
    var secondWindow: UIWindow?
    
    private init() {}
    
    func toggleOverlay() {
        if let win2 = secondWindow {
            if win2.isKeyWindow {
                mainWindow?.makeKeyAndVisible()
                win2.isHidden = true
            } else {
                win2.isHidden = false
                win2.makeKeyAndVisible()
            }
            
        }
    }
    
}
