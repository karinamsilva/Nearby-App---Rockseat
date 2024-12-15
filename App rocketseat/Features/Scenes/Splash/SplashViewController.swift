//
//  SplashViewController.swift
//  App rocketseat
//
//  Created by Karina on 11/12/24.
//

import UIKit

class SplashViewController: UIViewController {
    
    let contentView: SplashView
    
    weak var delegate: SplashFlowDelegate?
    
    init(contentView: SplashView, delegate: SplashFlowDelegate?) {
        self.contentView = contentView
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        decideFlow()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = Colors.greenLight
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.setupContentViewToController(content: contentView)
    }
    
    private func decideFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.delegate?.decideNavigationFlow()
        }
    }
}
