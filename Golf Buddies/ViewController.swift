//
//  ViewController.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    static var profile: Profile?
    
    public var authViewController: AuthViewController?
    public var createAccountViewController: CreateAccountViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Authentication.shared.checkStatus(self)
        
        if let authViewController = self.storyboard?.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController,
            let createAccountViewController = self.storyboard?.instantiateViewController(withIdentifier: "CreateAccountViewController") as? CreateAccountViewController{
            self.authViewController = authViewController
            self.createAccountViewController = createAccountViewController
            authViewController.setViewController(self)
            createAccountViewController.setViewController(self)
        }
        
        let _ = Firebase.shared
    }
    
    func getProfile() -> Bool{
        let standard = UserDefaults.standard
        if let id = standard.value(forKey: "id") as? String,
            let firstName = standard.value(forKey: "first-name") as? String,
            let lastName = standard.value(forKey: "last-name") as? String{
            ViewController.profile = Profile(id, firstName, lastName)
            return true
        }
        else{
            self.requestAuthentication()
        }
        return false
    }
    
    // If no log in details are present, a pop up is created to ask for details -- AuthViewController
    
    func requestAuthentication(){
        print("Requesting authorisation")
        if let authViewController = self.authViewController{
            self.present(authViewController, animated: true, completion: {
            })
        }
    }
    
}

func timestamp() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy:MM:dd:HH:mm:ss"
    let timestamp = dateFormatter.string(from: Date())
    return timestamp
}
