//
//  CellType.swift
//  LifeCreation
//
//  Created by Evelina on 01.10.2024.
//

import Foundation
import SwiftUI

enum CellType: Int {
    
    case dead
    case alive
    case life
    
    var text: String {
        switch self {
        case .dead:
            return "Мертвая"
        case .alive:
            return "Живая"
        case .life:
            return "Жизнь"
        }
    }
    
    var description: String {
        switch self {
        case .dead:
            return "или прикидывается"
        case .alive:
            return "и шевелится!"
        case .life:
            return "Ку-ку!"
        }
    }
    
    var icon: String {
        switch self {
        case .dead:
            return "💀"
        case .alive:
            return "💥"
        case .life:
            return "🐣"
        }
    }
    
    var gradientTopColor: Color {
        switch self {
        case .dead:
            return Color(red: 13/255, green: 101/255, blue: 138/255)
        case .alive:
            return Color(red: 255/255, green: 184/255, blue: 0/255)
        case .life:
            return Color(red: 173/255, green: 0/255, blue: 255/255)
        }
    }

    var gradientBottomColor: Color {
        switch self {
        case .dead:
            return Color(red: 176/255, green: 255/255, blue: 180/255)
        case .alive:
            return Color(red: 255/255, green: 247/255, blue: 176/255)
        case .life:
            return Color(red: 255/255, green: 176/255, blue: 233/255)
        }
    }
}
