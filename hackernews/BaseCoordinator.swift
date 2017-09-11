//
//  BaseCoordinator.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit

class BaseCoordinator: NSObject {
    
    // MARK: -
    
    fileprivate(set) var canvasViewController: UIViewController
    
    func insertControllerIntoCanvas(_ controller: UIViewController) {
        canvasViewController.insertChildController(controller, intoParentView: canvasViewController.view)
    }
    
    // MARK: - Init
    
    init(canvasViewController: UIViewController) {
        self.canvasViewController = canvasViewController
    }
    
    // MARK: - Child Controllers
    
    fileprivate var childCordinators: [BaseCoordinator] = []
    func addChildCoordinator(_ child: BaseCoordinator) {
        childCordinators.append(child)
    }
    
    // MARK: - Public
    
    func start() {
        assert(false, "Subclasses need to override 'start' method")
    }
    
}

