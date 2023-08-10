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

    public init(_ id: String, _ name: String) {
        self.golfer = Golfer(id, name)
        self.friends = []
    }
    
    public func addFriend(_ golfer: Golfer){
        self.friends.append(golfer)
    }
    
    
    
}
