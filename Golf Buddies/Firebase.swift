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
    
    public func getClubKeys(_ completion: @escaping ([String: String]) -> ()){
        var keys: [String: String] = [:]
        self.ref.child("club").observeSingleEvent(of: .value) { snapshot in
            for child in snapshot.children{
                if let data = child as? DataSnapshot{
                    if let clubTitle = data.childSnapshot(forPath: "title").value as? String{
                        keys[data.key] = clubTitle
                    }
                }
            }
            completion(keys)
        }
    }
    
    public func setHole(_ club: String, _ course: Int, _ hole: Int, _ par: Int, _ yards: Int){
        let layout = self.ref.child("club/\(club)/course/\(course)/layout/").child(String(hole))
        layout.setValue(["par":par,"yards":yards])
    }
    
    public func getCourseLayout(_ id: String, _ completion: @escaping ([Int: [Int: Hole]]) -> ()){
        
        var courses: [Int: [Int: Hole]] = [:]
        
        self.ref.child("club/\(id)/course").observeSingleEvent(of: .value) { snapshot in
            for child in snapshot.children{
                if let course = child as? DataSnapshot{
                    var holes: [Int: Hole] = [:]
                    for hole in course.childSnapshot(forPath: "layout").children{
                        if let holeData = hole as? DataSnapshot{
                            if let par = holeData.childSnapshot(forPath: "par").value as? Int, let yards = holeData.childSnapshot(forPath: "yards").value as? Int{
                                if let n = Int(holeData.key){
                                    holes[n] = Hole(par: par, yards: yards)
                                }
                            }
                        }
                    }
                    
                    if let courseKey = Int(course.key){
                        courses[courseKey] = holes
                    }
                }
            }
            completion(courses)
        }
    }
    
}
