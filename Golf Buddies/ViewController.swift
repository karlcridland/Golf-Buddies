//
//  ViewController.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    static var profile: Profile?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Authentication.shared.checkStatus(self)
    }
    
    func getProfile(){
        let standard = UserDefaults.standard
        if let id = standard.value(forKey: "id") as? String,
            let firstName = standard.value(forKey: "first-name") as? String,
            let lastName = standard.value(forKey: "last-name") as? String{
            ViewController.profile = Profile(id, firstName, lastName)
        }
        else{
            self.requestAuthentication()
        }
    }
    
    // If no log in details are present, a pop up is created to ask for details -- AuthViewController
    
    func requestAuthentication(){
        print("Requesting authorisation")
        if let auth = self.storyboard?.instantiateViewController(withIdentifier: "AuthViewController") as? AuthViewController{
            self.present(auth, animated: true, completion: {
                auth.setViewController(self)
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
