//
//  AppCoordinator.swift
//  city
//
//  Created by Hamid Zandi on 11/25/20.
//  Copyright © 2020 Kubak. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Properties
    var navigationController: UINavigationController
    private var window: UIWindow
    
    init(in window: UIWindow) {
        self.navigationController = UINavigationController()
        self.navigationController.setNavigationBarHidden(true, animated: true)
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        toWorkshopCoordinator()
    }
    
    private func toWorkshopCoordinator() {
//        let behCodinator = BehCordinator(with: navigationController)
//        behCodinator.start()
    }
    
    
    func finish() {

    }
    
}
