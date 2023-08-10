//
//  Firebase.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation
import FirebaseDatabase

class Firebase{
    
    public static let shared = Firebase()
    private var ref: DatabaseReference!
    
    private init(){
        self.ref = Database.database().reference()
    }
    
}
