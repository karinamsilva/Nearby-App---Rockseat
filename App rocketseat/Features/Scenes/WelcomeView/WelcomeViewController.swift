//
//  WelcomeViewController.swift
//  App rocketseat
//
//  Created by Karina on 12/12/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let contentView: WelcomeView
    
    weak var delegate: WelcomeFlowDelegate?
    
    init(contentView: WelcomeView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        
        contentView.didTapButton = { [weak self] in
            self?.delegate?.goToHome()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        view.backgroundColor = .white
    }
    
    private func setup() {
        view.addSubview(contentView)
    
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.setupContentViewToController(content: contentView)
    }
    
    
}
