//
//  UIViewController_extensions.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func insertChildController(_ child: UIViewController, intoParentView parentView: UIView) {
        child.willMove(toParentViewController: self)
        
        addChildViewController(child)
        child.view.frame = parentView.bounds
        parentView.addSubview(child.view)
        
        child.didMove(toParentViewController: self)
    }
    
    func removeFromParent() {
        removeFromParentViewController()
        view.removeFromSuperview()
    }
}
