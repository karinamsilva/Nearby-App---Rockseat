//
//  UIViewController+Ext.swift
//  App rocketseat
//
//  Created by Karina on 13/12/24.
//

import UIKit

extension UIViewController {
    
    public func setupContentViewToController(content: UIView) {
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            content.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }
}
