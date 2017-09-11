//
//  AuthCoordinator.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit

class AuthCoordinator: BaseCoordinator {
    
    weak var initialViewController: UIViewController?
    
    // MARK: - Coordinator override
    
    override func start() {
        let viewModel = LoginViewModel(coordinator: self)
        let initialViewController = LoginViewController.create(viewModel: viewModel)
        insertControllerIntoCanvas(initialViewController)
    }
    
    // MARK: -
    
    fileprivate func removeInitialController() {
        initialViewController?.removeFromParent()
        initialViewController = nil
    }
    
    func proceedToArticlesModule() {
        removeInitialController()
        
        let articlesCanvasViewController = UIViewController()
        let articlesCoordinator = ArticlesCoordinator(canvasViewController: articlesCanvasViewController)
        
        insertControllerIntoCanvas(articlesCanvasViewController)
        addChildCoordinator(articlesCoordinator)
        
        articlesCoordinator.start()
    }
    
}
