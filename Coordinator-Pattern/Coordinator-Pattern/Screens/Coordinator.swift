//  
//  Coordinator.swift
//  Coordinator-Pattern
//
//  Created by Yaşar Duman on 7.12.2023.
//

import UIKit

// MARK: - Coordinator Protokolü
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var childCoordinators: [Coordinator] { get set }
    
    // Ana işlemi başlat
    func start()
    
    // Koordinatörü sonlandır
    func finish()
    
    func childDidFinish(_ child: Coordinator?)
}

// MARK: - Default Implementasyonlar
extension Coordinator {
    // Varsayılan olarak hiçbir şey yapma
    func finish() { }

    // Alt koordinatörü kaldır
    func childDidFinish(_ child: Coordinator?) {
        childCoordinators.removeAll(where: { $0 === child })
    }
}
