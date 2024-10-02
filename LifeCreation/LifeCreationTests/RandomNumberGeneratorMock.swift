//
//  RandomNumberGeneratorMock.swift
//  LifeCreationTests
//
//  Created by Evelina on 02.10.2024.
//

import Foundation
@testable import LifeCreation

final class RandomNumberGeneratorMock: RandomNumberGeneratorProtocol {
    
    var isDeadCellNext: Bool = true
    
    func random(in range: Range<Int>) -> Int {
        return isDeadCellNext ? CellType.dead.rawValue : CellType.alive.rawValue
    }
}
