//
//  FlowCoordinator .swift
//  App rocketseat
//
//  Created by Karina on 10/12/24.
//

import UIKit

class FlowCoordinator {
    private var navigationController : UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UIViewController? {
        let startViewController = UIViewController()
        startViewController.view.backgroundColor = .red
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
        
    }
}
