//
//  SplashView.swift
//  App rocketseat
//
//  Created by Karina on 11/12/24.
//

import UIKit

class SplashView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "backgroundImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private func setupUI() {
        self.addSubview(logoImageView)
        self.addSubview(backgroundImage)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
