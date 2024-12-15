//
//  NearbyFlowControllerr.swift
//  App rocketseat
//
//  Created by Karina on 11/12/24.
//

import Foundation
import UIKit

class NearbyFlowControllerr {
    private var navigationController : UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let contentView = SplashView()
        let startViewController = SplashViewController(contentView: contentView, delegate: self)
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
        
    }
}

extension NearbyFlowControllerr: SplashFlowDelegate {
    func decideNavigationFlow() {
        let contentView = WelcomeView()
        let welcomeViewController = WelcomeViewController(contentView: contentView)
        welcomeViewController.delegate = self
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}

extension NearbyFlowControllerr: WelcomeFlowDelegate {
    func goToHome() {
        let homeViewController = HomeViewController()
        navigationController?.pushViewController(homeViewController, animated: true)
    }
    
}
