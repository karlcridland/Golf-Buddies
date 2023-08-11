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
    
    private var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInButton.addTarget(self, action: #selector(self.signInClicked), for: .touchUpInside)
    }
    
    @objc func signInClicked(){
        if let viewController = self.viewController{
            
        }
    }
    
    public func setViewController(_ viewController: ViewController){
        self.viewController = viewController
    }
    
}
