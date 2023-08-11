//
//  Authentication.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation
import FirebaseAuth

class Authentication{
    
    private let auth: Auth
    private var user: User?
    
    public static let shared = Authentication()
    
    private init(){
        self.auth = Auth.auth()
    }
    
    public func checkStatus(_ viewController: ViewController){
        self.auth.addStateDidChangeListener { auth, user in
            self.user = user
            if let user = user{
                UserDefaults.standard.setValue(user.uid, forKey: "id")
                Firebase.shared.getName(user.uid) { firstName, lastName in
                    print(firstName, lastName)
                }
            }
            viewController.getProfile()
        }
    }
    
    public func signIn(_ email: String, _ password: String){
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let authResult = authResult{
                print(authResult.description)
            }
            guard let _ = self else { return }
        }
    }
    
    public func signOut(){
        do {
            try self.auth.signOut()
            UserDefaults.standard.removeObject(forKey: "id")
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    public func createAccount(_ email: String, _ password: String){
        auth.createUser(withEmail: email, password: password) { authResult, error in
        }
    }
    
}
