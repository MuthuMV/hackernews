//
//  BaseViewController.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<ViewModelType>: UIViewController {
    
    // MARK: - RxSwift Dispose Bag
    
    let disposeBag = DisposeBag()
    
    // MARK: - UIViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    // MARK: - Subclass
    
    // MARK: Setup UI
    
    func setupUI() {}
    
    // MARK: ViewModel Generic Property
    
    fileprivate(set) var viewModel: ViewModelType!
    func bindViewModel() {}
    
}

// MARK: - Factory

extension BaseViewController {
    
    static func create(viewModel: ViewModelType) -> Self {
        let vc = UIStoryboard.instantiateViewController(ofType: self)
        vc.viewModel = viewModel
        return vc
    }
}
