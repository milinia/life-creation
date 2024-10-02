//
//  CellModel.swift
//  LifeCreation
//
//  Created by Evelina on 02.10.2024.
//

import Foundation

struct CellModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let type: CellType
}
