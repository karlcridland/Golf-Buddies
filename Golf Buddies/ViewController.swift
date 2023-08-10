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
        self.getProfile()
    }
    
    func getProfile(){
        let standard = UserDefaults.standard
        if let id = standard.value(forKey: "id") as? String, let name = standard.value(forKey: "name") as? String{
            ViewController.profile = Profile(id, name)
        }
        else{
            self.requestProfile()
        }
    }
    
    func requestProfile(){
        
    }

}

