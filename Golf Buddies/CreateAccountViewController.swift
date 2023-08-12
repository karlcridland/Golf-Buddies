//
//  CreateAccountViewController.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 11/08/2023.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController{
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var createFirstName: UITextField!
    @IBOutlet var createLastName: UITextField!
    @IBOutlet var createEmailAddress: UITextField!
    @IBOutlet var createPassword: UITextField!
    @IBOutlet var createRetypePassword: UITextField!
    
    private var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.createAccountButton.addTarget(self, action: #selector(self.signInClicked), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
    }
    
    @objc func signInClicked(){
//        if let viewController = self.viewController, let e = email.text, let p = password.text{
//            Authentication.shared.signIn(e, p)
//            self.dismiss(animated: true)
//        }
    }
    
    @objc func back(){
        if let viewController = self.viewController, let authViewController = viewController.authViewController{
            self.dismiss(animated: true){
                viewController.present(authViewController, animated: true)
            }
        }
    }
    
    public func setViewController(_ viewController: ViewController){
        self.viewController = viewController
    }
}
