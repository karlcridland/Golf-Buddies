//
//  Round.swift
//  Golf Buddies
//
//  Created by Karl Cridland on 10/08/2023.
//

import Foundation

class Round{
    
    private var scores: [String: Int]
    var par: Int?
    var distance: Int?
    
    init(_ par: Int?){
        scores = [:]
    }
    
    func addScore(_ id: String){
        if let score = scores[id]{
            scores[id] = score + 1
        }
        else{
            scores[id] = 1
        }
    }
    
    func getScores() -> [String: Int]{
        var results: [String: Int] = [:]
        scores.forEach { (id, score) in
            results[id] = score
            if let par = self.par{
                results[id] = par - score
            }
        }
        return results
    }
    
}
