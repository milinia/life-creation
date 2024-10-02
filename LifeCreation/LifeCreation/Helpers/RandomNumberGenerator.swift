//
//  RandomNumberGenerator.swift
//  LifeCreation
//
//  Created by Evelina on 02.10.2024.
//

import Foundation

protocol RandomNumberGeneratorProtocol {
    func random(in range: Range<Int>) -> Int
}

class RandomNumberGenerator: RandomNumberGeneratorProtocol {
    func random(in range: Range<Int>) -> Int {
        return Int.random(in: range)
    }
}
