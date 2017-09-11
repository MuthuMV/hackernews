//
//  ArticlesCoordinator.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit

class ArticlesCoordinator: BaseCoordinator {
    
    fileprivate var navigationController: UINavigationController?
    
    override func start() {
        // cleanup
        navigationController?.removeFromParent()
        navigationController = nil
        
        showArticlesListScreen()
    }
    
    func showArticlesListScreen() {
        
    }
    
    func showArticleDetailScreen() {
        
    }
}
