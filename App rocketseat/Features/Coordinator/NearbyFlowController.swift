//
//  Coordinator.swift
//  App rocketseat
//
//  Created by Karina on 11/12/24.
//

import UIKit

class NearbyFlowController {
    private var navigationController : UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
        
    }
}