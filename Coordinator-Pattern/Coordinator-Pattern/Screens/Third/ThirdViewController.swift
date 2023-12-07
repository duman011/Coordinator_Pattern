//
//  ThirdViewController.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//

import UIKit

final class ThirdViewController: UIViewController {
    //MARK: - Properties
    weak var coordinator: ThirdCoordinator?
    
    //MARK: - UI Elements
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 6
        return stackView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "ThirdViewController"
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.configuration?.baseBackgroundColor = .purple
        button.configuration?.baseForegroundColor = .purple
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Go Back!", for: .normal)
        button.addTarget(nil, action: #selector(toBack), for: .touchUpInside)
        return button
    }()

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isMovingFromParent {
            coordinator?.navigationBackButton()
        }
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(backButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    // MARK: - @Actions
    @objc private func toBack(_ sender: UIButton) {
        coordinator?.finish()
    }
}
