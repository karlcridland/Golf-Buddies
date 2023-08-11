//
//  Profile.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation

class Profile{
    
    public let golfer: Golfer
    public var friends: [Golfer]

    public init(_ id: String, _ firstName: String, _ lastName: String) {
        self.golfer = Golfer(id, firstName, lastName)
        self.friends = []
    }
    
    public func addFriend(_ golfer: Golfer){
        self.friends.append(golfer)
    }
    
}
