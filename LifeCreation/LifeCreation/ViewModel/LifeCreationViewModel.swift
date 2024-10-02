//
//  LifeCreationViewModel.swift
//  LifeCreation
//
//  Created by Evelina on 01.10.2024.
//

import Foundation

final class LifeCreationViewModel: ObservableObject {
    @Published var cells: [CellModel] = []
    var lifeIndexes: [Int] = []
    private let randomNumberGenerator: RandomNumberGeneratorProtocol
    
    init(randomNumberGenerator: RandomNumberGeneratorProtocol) {
        self.randomNumberGenerator = randomNumberGenerator
    }
    
    func createNewCell() {
        let randomNumber = randomNumberGenerator.random(in: 0..<2)
        guard let type = CellType(rawValue: randomNumber) else { return }
        let newCell = CellModel(type: type)
        cells.append(newCell)
        checkCells()
    }
    
    private func checkCells() {
        guard cells.count >= 3 else { return }
        let lastThreeCells = [cells[cells.count - 1], cells[cells.count - 2], cells[cells.count - 3]]
        
        if lastThreeCells.allSatisfy({$0.type == .alive}) {
            let lifeCell = CellModel(type: CellType.life)
            cells.append(lifeCell)
            lifeIndexes.append(cells.count - 1)
        } else if lastThreeCells.allSatisfy({$0.type == .dead}){
            var count = 0
            for index in lifeIndexes.reversed() {
                count += 1
                if cells.count - 3 - index <= 10 {
                    lifeIndexes.remove(at: lifeIndexes.count - count)
                    count = 0
                    cells.remove(at: index)
                }
            }
        }
    }
}
