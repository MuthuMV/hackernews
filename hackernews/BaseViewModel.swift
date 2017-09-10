//
//  BaseViewModel.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Foundation
import RxSwift

protocol BaseViewModelType: class {
    func alertViewObservable() -> Observable<String>
}

class BaseViewModel: BaseViewModelType {
    
    var disposeBag = DisposeBag()
    
    var alertViewBasicText = Variable<String>("")
    
    func alertViewObservable() -> Observable<String> {
        return alertViewBasicText.asObservable().skip(1)
    }
    
    func reactIfNetworkConnectionError(_ error: Error) {
        if (error as NSError).code == -1009 {
            alertViewBasicText.value = "Please check your internet connection"
        }
    }
}
