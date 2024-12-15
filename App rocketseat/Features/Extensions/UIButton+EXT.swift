//
//  UIButton+EXT.swift
//  App rocketseat
//
//  Created by Karina on 14/12/24.
//

import UIKit

extension UIButton {
    func makeFilterButton(title: String, iconName: String) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.gray300.cgColor
        button.titleLabel?.adjustsFontSizeToFitWidth = false
        button.titleLabel?.lineBreakMode = .byClipping
        button.titleLabel?.numberOfLines = 1
        button.tintColor = Colors.gray600
        button.backgroundColor = Colors.gray100
        button.setTitleColor(Colors.gray600, for: .normal)
        button.titleLabel?.font = Typography.textSM
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button.imageView?.contentMode = .scaleAspectFit
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        button.imageView?.heightAnchor.constraint(equalToConstant: 16).isActive = true
        button.imageView?.widthAnchor.constraint(equalToConstant: 16).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 8)
        
        return button 
    }
}
