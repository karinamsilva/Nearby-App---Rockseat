//
//  HomeView.swift
//  App rocketseat
//
//  Created by Karina on 13/12/24.
//

import Foundation
import MapKit

class HomeView: UIView {
    
    private var filterButtonAction: ((Category) -> Void)?
    private var categories: [Category] = []
    private var selectedButton: UIButton?
    
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let filterScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray100
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    private let dragIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray300
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Explore locais perto de você"
        label.textColor = Colors.gray600
        label.font = Typography.textMD
        return label
    }()
    
    private let filterStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.isUserInteractionEnabled = true
        stack.spacing = 8
        return stack
    }()
    
    private let placesTableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.identifier)
        table.separatorStyle = .none
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var containerTopConstraint: NSLayoutConstraint!
    
    private func setupUI() {
        addSubview(mapView)
        addSubview(filterScrollView)
        addSubview(containerView)
        
        filterScrollView.addSubview(filterStackView)
        
        containerView.addSubview(dragIndicator)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(placesTableView)
        
        setupPanGesture()
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            
            filterScrollView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            filterScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterScrollView.heightAnchor.constraint(equalTo: filterStackView.heightAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            filterStackView.topAnchor.constraint(equalTo: filterScrollView.topAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor, constant: 24),
            filterStackView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor, constant: -24),
            filterStackView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStackView.heightAnchor.constraint(equalToConstant: 40),
            
        ])
        
        containerTopConstraint = containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -16)
        containerTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            dragIndicator.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dragIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dragIndicator.widthAnchor.constraint(equalToConstant: 80),
            dragIndicator.heightAnchor.constraint(equalToConstant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: dragIndicator.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            placesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            placesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            placesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
        ])
    }
    
    func configureTableViewDelegate(_ delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        placesTableView.dataSource = dataSource
        placesTableView.delegate = delegate
    }
    
    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        containerView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        let velocity = gesture.velocity(in: self)
        
        switch gesture.state {
        case .changed:
            let newConstant = containerTopConstraint.constant + translation.y
            if newConstant <= 0 && newConstant >= frame.height * 0.05 {
                containerTopConstraint.constant = newConstant
                gesture.setTranslation(.zero, in: self)
            }
        case .ended:
            let halfScreenHeight = -frame.height * 0.25
            let finalPosition: CGFloat
            if velocity.y > 0 {
                finalPosition = 0
            } else {
                finalPosition = halfScreenHeight
            }
            
            UIView.animate(withDuration: 0.3, animations: {
                self.containerTopConstraint.constant = finalPosition
                self.layoutIfNeeded()
            })
        default:
            break
        }
        
    }
    
    func updateFilterButtons(with categories: [Category], action: @escaping (Category) -> Void) {
        let categoryIcons: [String: String] = [
            "Alimentação": "fork.knife",
            "Compras": "cart",
            "Hospedagem": "bed.double",
            "Padaria": "cup.and.saucer",
        ]
        
        self.categories = categories
        self.filterButtonAction = action
        
        for (index, category) in categories.enumerated() {
            let iconName = categoryIcons[category.name] ?? "questionmark.circle"
            let button = createFilterButton(title: category.name, iconName: iconName)
            button.tag = index
            button.addTarget(self, action: #selector(filteredButtonTapped(_:)), for: .touchUpInside)
            if category.name == "Alimentação" {
                updateButtonSelection(button: button)
            }
            filterStackView.addArrangedSubview(button)
        }
        
    }
    
    func reloadTableViewData() {
        DispatchQueue.main.async {
            self.placesTableView.reloadData()
            
        }
    }
    
    private func createFilterButton(title: String, iconName: String) -> UIButton {
        let button = UIButton().makeFilterButton(title: title, iconName: iconName)
        return button
    }
    
    private func updateButtonSelection(button: UIButton) {
        if let previousButton = selectedButton {
            previousButton.backgroundColor = Colors.gray100
            previousButton.setTitleColor(Colors.gray600, for: .normal)
            previousButton.tintColor = Colors.gray600
        }
        
        button.backgroundColor = Colors.greenBase
        button.setTitleColor(Colors.gray100, for: .normal)
        button.tintColor = Colors.gray100
        
        selectedButton = button
    }
    
    @objc private func filteredButtonTapped(_ sender: UIButton) {
        let selectedCategory =  categories[sender.tag]
        updateButtonSelection(button: sender)
        filterButtonAction?(selectedCategory)
        
    }
}
