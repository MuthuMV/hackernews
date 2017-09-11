//
//  LoginViewModel.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Foundation
import RxSwift
import GoogleSignIn

protocol LoginViewModelType: BaseViewModelType {
    var loginSubject: PublishSubject<Void> { get }
}

class LoginViewModel: BaseViewModel, LoginViewModelType {
    
    fileprivate let service = UserService()
    fileprivate var coordinator: AuthCoordinator
    
    fileprivate(set) var loginSubject = PublishSubject<Void>()

    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
        super.init()
        
        loginSubject.asObserver()
            .subscribe(onNext: { [weak self] in
                guard let `self` = self else {
                    return
                }
                // Fetch data from server
            })
            .disposed(by: disposeBag)
    }
}

