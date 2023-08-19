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
    
    private static var all = [String: Club]()
    
    var courses: [String: [Int: Hole]]
    
    init(_ id: String, _ title: String){
        self.id = id
        self.title = title
        self.courses = [:]
        self.getCoursesData()
        
        if (!Club.all.keys.contains(id)){
            Club.all[id] = (self)
        }
        
    }
    
    public static func getAllCourses() -> [String: Club]{
        return Club.all
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
    
    private func getCoursesData(){
        Firebase.shared.getCourseLayout(self.id) { courses in
            print(courses)
        }
    }
    
}

struct Hole{
    let par: Int
    let yards: Int
}
