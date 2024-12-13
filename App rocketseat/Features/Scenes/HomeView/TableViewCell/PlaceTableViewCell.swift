//
//  PlaceTableViewCell.swift
//  App rocketseat
//
//  Created by Karina on 13/12/24.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    static let identifier = "placeCell"
    
    let itemImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.titleSM
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textColor = Colors.gray300
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.textSM
        return label
    }()
    
    let ticketIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = Colors.redBase
        image.image = UIImage(named: "ticket")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let ticketLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.textXS
        return label
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.gray200.cgColor
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(containerView)
        
        containerView.addSubview(itemImage)
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(ticketIcon)
        containerView.addSubview(ticketLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            itemImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: itemImage.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            ticketIcon.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            ticketIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            ticketIcon.widthAnchor.constraint(equalToConstant: 13),
            ticketIcon.heightAnchor.constraint(equalToConstant: 11),
            
            titleLabel.centerYAnchor.constraint(equalTo: ticketIcon.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: ticketIcon.leadingAnchor, constant: 4)
        ])
    }
    
    private func configureWithPlace(with place: PlaceModel) {
        itemImage.image = UIImage(named: place.imageName)
        titleLabel.text = place.title
        descriptionLabel.text = place.description
        ticketLabel.text = "cupons disponíveis \(place.tickets)"
    }
}
