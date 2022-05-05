//
//  Judgment.swift
//  Blackjack
//
//  Created by 카카오VX on 2022/05/05.
//

import Foundation

protocol Judgeable {
    func firstSelectableScore() -> Int
    func lastSelectableScore() -> Int
    mutating func append(_ score: Int)
}

struct Judgment: Judgeable {
    private(set) var judgeableScores: [Int]
    
    func firstSelectableScore() -> Int {
        judgeableScores.first ?? 0
    }
    
    func lastSelectableScore() -> Int {
        judgeableScores.last ?? 0
    }
    
    mutating func append(_ score: Int) {
        judgeableScores.append(score)
    }
}
