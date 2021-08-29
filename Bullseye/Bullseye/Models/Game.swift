//
//  Game.swift
//  Bullseye
//
//  Created by Sophia Tang on 8/29/21.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(sliderValue: Int) -> Int {
        if sliderValue == target {
            return sliderValue
        }
        return sliderValue / 2
    }
    
    mutating func addRound() {
        round += 1
    }
    
    mutating func addScore(points: Int) {
        score += points
    }
    
    mutating func generateTarget() {
        target = Int.random(in: 1...100)
    }
}
