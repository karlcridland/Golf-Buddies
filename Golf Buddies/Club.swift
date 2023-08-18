//
//  Club.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 15/08/2023.
//

import Foundation

class Club{
    
    let id: String
    let title: String
    
    static var all = [Club]()
    
    var courses: [String: [Int: Hole]]
    
    init(_ id: String, _ title: String){
        self.id = id
        self.title = title
        self.courses = [:]
        self.getCourses()
        
        if (!Club.all.contains(where: {$0.id == id})){
            Club.all.append(self)
        }
        
    }
    
    func getDistance(_ course: String) -> Int{
        var total = 0
        if let holes = courses[course]{
            holes.forEach { (n, hole) in
                total += hole.yards
            }
        }
        return total
    }
    
    private func getCourses(){
        Firebase.shared.getCourseLayout(self.id) { courses in
            print(courses)
        }
    }
    
}

struct Hole{
    let par: Int
    let yards: Int
}
