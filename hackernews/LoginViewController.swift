//
//  LoginViewController.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import GoogleSignIn

class LoginViewController: BaseViewController<LoginViewModelType> {
    
    @IBOutlet weak var googleSignInButton: GIDSignInButton!
    
    override func setupUI() {
        GIDSignIn.sharedInstance().uiDelegate = self
        googleSignInButton.style = .wide
    }
    
    override func bindViewModel() {
        
    }
    
    @IBAction func googleSignInButtonClicked(_ sender: Any) {
        self.dismiss(animated: true) { 
            GIDSignIn.sharedInstance().signIn()
        }
    }
}

extension LoginViewController: GIDSignInUIDelegate {
    @nonobjc func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        
    }
    
    @nonobjc func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        
    }
    @nonobjc func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        print(signIn.currentUser)
        print(signIn.clientID)
    }
}
