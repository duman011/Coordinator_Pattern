//
//  FirstViewController.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//

import UIKit

final class FirstViewController: UIViewController {
    
    //MARK: - Properties
    weak var coordinator: FirstCoordinator?
    
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
        label.text = "FirstViewController"
        return label
    }()
    
    private lazy var pushSecondButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.configuration?.baseBackgroundColor = .red
        button.configuration?.baseForegroundColor = .red
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Push Second!", for: .normal)
        button.addTarget(nil, action: #selector(toSecond), for: .touchUpInside)
        return button
    }()
    

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(pushSecondButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    @objc private func toSecond(_ sender: UIButton) {
        coordinator?.pushSecond()
    }
}
