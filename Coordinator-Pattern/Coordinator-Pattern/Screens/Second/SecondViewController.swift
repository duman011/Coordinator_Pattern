//
//  SecondViewController.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//
import UIKit

final class SecondViewController: UIViewController {
    
    //MARK: - Properties
    weak var coordinator: SecondCoordinator?
    
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
        label.text = "SecondViewController"
        return label
    }()
    
    private lazy var presentThirdButton: UIButton = {
        let button = UIButton(configuration: .tinted())
        button.configuration?.baseBackgroundColor = .orange
        button.configuration?.baseForegroundColor = .orange
        button.configuration?.cornerStyle = .capsule
        button.setTitle("Present Third!", for: .normal)
        button.addTarget(nil, action: #selector(toThird), for: .touchUpInside)
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
            coordinator?.finish()
        }
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(presentThirdButton)
        stackView.frame = CGRect(origin: .zero, size: CGSize(width: 400, height: 100))
        stackView.center = view.center
    }
    
    // MARK: - @Actions
    @objc private func toThird(_ sender: UIButton) {
        coordinator?.presentThird()
    }
}

