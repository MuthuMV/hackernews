//
//  UIStoryboard_extensions.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static func instantiateViewController<T>(ofType type: T.Type) -> T {
        let identifier = String(describing: type)
        let storyboard = UIStoryboard(name: identifier, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
