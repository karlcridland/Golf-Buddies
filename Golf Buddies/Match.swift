//
//  Match.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation

class Match{
    
    private var golfers: [Golfer]
    private var courseType: CourseType
    private var rounds: [Round]
    private var round = 1
    
    private var id: String
    
    init(_ courseType: CourseType, _ id: String?) {
        self.golfers = []
        self.courseType = courseType
        self.rounds = []
        self.id = id ?? ""
        
        for _ in 0 ..< courseType.rawValue{
            self.rounds.append(Round(nil))
        }
        
    }
    
    public func appendGolfer(_ golfer: Golfer){
        self.golfers.append(golfer)
    }
    
    public func nextRound(){
        self.round += 1
    }
    
    public func addScore(_ id: String){
        let round = rounds[round - 1]
        round.addScore(id)
    }
    
    public func addScore(){
        
    }
    
    public func getScores() -> [Int: [String: Int]]{
        var scores: [Int: [String: Int]] = [:]
        self.rounds.enumerated().forEach { (i, r) in
            scores[i] = r.getScores()
        }
        return scores
    }
    
}

enum CourseType: Int{
    case nineHoles = 9
    case eighteenHoles = 18
}
