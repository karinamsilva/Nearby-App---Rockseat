//
//  TipsView.swift
//  App rocketseat
//
//  Created by Karina on 12/12/24.
//

import UIKit

class TipsView: UIView {
    
    private let iconImageview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.titleSM
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.textSM
        label.numberOfLines = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(icon: UIImage, title: String, description: String) {
        super.init(frame: .zero)
        setupUI()
        setupConstraints()
        setupComponents(icon: icon, title: title, description: description)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents(icon: UIImage, title: String, description: String) {
        iconImageview.image = icon
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    private func setupUI() {
        self.addSubview(iconImageview)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconImageview.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageview.topAnchor.constraint(equalTo: topAnchor),
            iconImageview.heightAnchor.constraint(equalToConstant: 24),
            iconImageview.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconImageview.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: iconImageview.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    
    
}
