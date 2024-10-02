//
//  LifeCreationViewModelTests.swift
//  LifeCreationTests
//
//  Created by Evelina on 02.10.2024.
//

import XCTest
@testable import LifeCreation

final class LifeCreationViewModelTests: XCTestCase {
    
    private var lifeCreationViewModel: LifeCreationViewModel!
    private var randomNumberGeneratorMock: RandomNumberGeneratorMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        randomNumberGeneratorMock = RandomNumberGeneratorMock()
        lifeCreationViewModel = LifeCreationViewModel(randomNumberGenerator: randomNumberGeneratorMock)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        randomNumberGeneratorMock = nil
        lifeCreationViewModel = nil
    }

    func testCreatingLifeCell() throws {
        //given
        let cellArray = [CellModel(type: .alive), CellModel(type: .alive)]
        //when
        randomNumberGeneratorMock.isDeadCellNext = false
        lifeCreationViewModel.cells = cellArray
        lifeCreationViewModel.createNewCell()
        //then
        XCTAssertEqual(lifeCreationViewModel.cells.last?.type, .life)
    }
    
    func testCreatingDeadCell() throws {
        //given
        let cellArray = [CellModel(type: .alive), CellModel(type: .alive)]
        //when
        randomNumberGeneratorMock.isDeadCellNext = true
        lifeCreationViewModel.cells = cellArray
        lifeCreationViewModel.createNewCell()
        //then
        XCTAssertEqual(lifeCreationViewModel.cells.last?.type, .dead)
    }

    func testDeletingLifeCell() throws {
        //given
        let cellArray = [CellModel(type: .alive), CellModel(type: .alive), CellModel(type: .alive),
                         CellModel(type: .life), CellModel(type: .dead), CellModel(type: .dead)]
        //when
        randomNumberGeneratorMock.isDeadCellNext = true
        lifeCreationViewModel.cells = cellArray
        guard let index = cellArray.firstIndex(where: {$0.type == .life}) else { return }
        lifeCreationViewModel.lifeIndexes = [index]
        lifeCreationViewModel.createNewCell()
        //then
        XCTAssertTrue(lifeCreationViewModel.cells.allSatisfy({$0.type != .life}))
    }
    
    func testDeletingMultipleLifeCell() throws {
        //given
        let cellArray = [CellModel(type: .alive), CellModel(type: .alive), CellModel(type: .alive),
                         CellModel(type: .life), CellModel(type: .alive), CellModel(type: .alive),
                         CellModel(type: .alive), CellModel(type: .life), CellModel(type: .dead),
                         CellModel(type: .dead)]
        //when
        randomNumberGeneratorMock.isDeadCellNext = true
        lifeCreationViewModel.cells = cellArray
        var indexes: [Int] = []
        cellArray.enumerated().forEach { index, cell in
            if cell.type == .life {
                indexes.append(index)
            }
        }
        lifeCreationViewModel.lifeIndexes = indexes
        lifeCreationViewModel.createNewCell()
        //then
        XCTAssertTrue(lifeCreationViewModel.cells.allSatisfy({$0.type != .life}))
    }
}
