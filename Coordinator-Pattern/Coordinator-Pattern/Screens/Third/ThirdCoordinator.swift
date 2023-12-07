//
//  ThirdCoordinator.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//
import UIKit

// MARK: - Third Coordinator
class ThirdCoordinator: Coordinator {
    
    // MARK: - Properties
    weak var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    
    // MARK: - Initialization
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Lifecycle
    func start() {
        let thirdViewController = ThirdViewController()
        thirdViewController.coordinator = self
        
        navigationController.pushViewController(thirdViewController, animated: true)
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - Navigation Back Button Tapped
    func navigationBackButton() {
        parentCoordinator?.childDidFinish(self)
    }
}
