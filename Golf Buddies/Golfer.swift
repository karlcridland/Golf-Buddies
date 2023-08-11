//
//  Golfer.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation

class Golfer{
    
    let id: String
    var firstName, lastName: String
    
    init(_ id: String, _ firstName: String, _ lastName: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String{
        return "\(self.firstName) \(self.lastName)"
    }
    
}
