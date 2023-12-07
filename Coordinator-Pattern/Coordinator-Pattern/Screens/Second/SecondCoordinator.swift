//
//  SecondCoordinator.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//

import UIKit


final class SecondCoordinator: Coordinator {
    
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
        let secondViewController = SecondViewController()
        secondViewController.coordinator = self
        
        navigationController.pushViewController(secondViewController, animated: true)
    }
    
    func finish() {
        parentCoordinator?.childDidFinish(self)
        navigationController.popViewController(animated: true)
    }
    
    // MARK: - Navigation
    func presentThird() {
        let thirdCoordinator = ThirdCoordinator(navigationController: navigationController)
        
        thirdCoordinator.parentCoordinator = self
        
        childCoordinators.append(thirdCoordinator)
        thirdCoordinator.start()
    }
}
