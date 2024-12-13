//
//  WelcomeView.swift
//  App rocketseat
//
//  Created by Karina on 12/12/24.
//

import UIKit

class WelcomeView: UIView {
    
    private let logoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logoIcon")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.text = "Boas vindas ao Nearby"
        label.font = Typography.titleXL
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.titleMD
        label.numberOfLines = .zero
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tenha cupons de vantagens para usar em seus estabelecimentos favoritos"
        return label
    }()
    
    let tipsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 24
        return stack
    }()
    
    private let subtextForTips: UILabel = {
        let label = UILabel()
        label.font = Typography.textMD
        label.numberOfLines = .zero
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Veja como funciona"
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.backgroundColor = Colors.greenBase
        button.titleLabel?.font =  Typography.action
        button.setTitleColor(Colors.gray100, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setupTips()
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(subtextForTips)
        addSubview(tipsStackView)
        addSubview(startButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            subtextForTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            subtextForTips.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            
            tipsStackView.topAnchor.constraint(equalTo: subtextForTips.bottomAnchor, constant: 16),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
            
        
        ])
        
    }
    
    private func setupTips() {
        guard let iconWrapped = UIImage(named: "mapIcon"),
              let secondIconWrapped = UIImage(named: "qrcode"),
              let thirdIconWrapped = UIImage(named: "ticket") else { return }
        let firstTip = TipsView(icon: iconWrapped,
                                title: "Encontre estabelecimentos",
                                description: "Veja locais perto de você que são parceiros Nearby")
        
        let secondTip = TipsView(icon: secondIconWrapped,
                                 title: "Ative o cupom com QR Code",
                                 description: "Escaneie o código no estabelecimento para usar o benefício")
        
        let thirdTip = TipsView(icon: thirdIconWrapped,
                                title: "Garanta vantagem perto de você",
                                description: "Ative cupons onde estiver, em diferentes tipos de estabelecimentos")
        
        tipsStackView.addArrangedSubview(firstTip)
        tipsStackView.addArrangedSubview(secondTip)
        tipsStackView.addArrangedSubview(thirdTip)
        
        
    }
}
