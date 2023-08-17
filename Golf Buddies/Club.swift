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
    
    var courses: [String: Any]
    
    init(_ id: String, _ title: String){
        self.id = id
        self.title = title
        self.courses = [:]
        self.getCourses()
    }
    
    private func getCourses(){
        
    }
    
}
