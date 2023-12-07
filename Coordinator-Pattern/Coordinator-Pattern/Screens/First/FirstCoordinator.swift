//
//  FirstCoordinator.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//

import UIKit

final class FirstCoordinator: Coordinator {
    // MARK: - Properties
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    //MARK: - Initializers
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Lifecycle
    func start() {
        let firstViewController = FirstViewController()
        firstViewController.coordinator = self
        
        navigationController.pushViewController(firstViewController, animated: true)
    }
    
    // MARK: - Navigation
    func pushSecond() {
        let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        
        secondCoordinator.parentCoordinator = self
        
        childCoordinators.append(secondCoordinator)
        secondCoordinator.start()
    }
}
