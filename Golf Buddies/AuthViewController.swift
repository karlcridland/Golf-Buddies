//
//  AuthViewController.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 11/08/2023.
//

import Foundation
import UIKit

class AuthViewController: UIViewController{
    
    @IBOutlet var email: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    @IBOutlet var createAccountButton: UIButton!
    
    private var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInButton.addTarget(self, action: #selector(self.signIn), for: .touchUpInside)
        self.forgotPasswordButton.addTarget(self, action: #selector(self.signIn), for: .touchUpInside)
        self.createAccountButton.addTarget(self, action: #selector(self.createAccount), for: .touchUpInside)
    }
    
    @objc func signIn(){
        if let _ = self.viewController, let e = email.text, let p = password.text{
            Authentication.shared.signIn(e, p)
            self.dismiss(animated: true)
        }
    }
    
    @objc func createAccount(){
        if let viewController = self.viewController, let createAccountViewController = viewController.createAccountViewController{
            print("dismissing")
            self.dismiss(animated: true){
                print("hello there")
                viewController.present(createAccountViewController, animated: true)
            }
        }
    }
    
    public func setViewController(_ viewController: ViewController){
        self.viewController = viewController
    }
    
}
