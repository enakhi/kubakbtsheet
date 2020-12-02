//
//  Coordinator.swift
//  city
//
//  Created by Hamid Zandi on 11/25/20.
//  Copyright © 2020 Kubak. All rights reserved.
//

import UIKit

enum navigationStyle {
    case present
    case push
}

protocol Coordinator: class {
    
    var navigationController: UINavigationController { get }
    
}

extension Coordinator {
    
    func navigate(to viewController: UIViewController, with presentationStyle: navigationStyle, animated: Bool = false) {
        switch presentationStyle {
        case .present:
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
    
    func finish() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

}
