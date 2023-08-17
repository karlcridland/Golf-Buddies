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
    
    public func getName(_ id: String, _ completion: (String, String) -> ()){
        self.ref.child("user/name/first/\(id)").observeSingleEvent(of: .value) { snap_a in
            self.ref.child("user/name/last/\(id)").observeSingleEvent(of: .value) { snap_b in
                if let firstName = snap_a.value as? String, let lastName = snap_b.value as? String{
                    print(firstName, lastName)
                }
            }
        }
    }
    
    public func setHole(_ club: String, _ course: Int, _ hole: Int, _ par: Int, _ yards: Int){
        let layout = self.ref.child("club/\(club)/course/\(course)/layout/").child(String(hole))
        layout.setValue(["par":par,"yards":yards])
    }
    
}
