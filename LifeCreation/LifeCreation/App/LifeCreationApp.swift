//
//  LifeCreationApp.swift
//  LifeCreation
//
//  Created by Evelina on 01.10.2024.
//

import SwiftUI

@main
struct LifeCreationApp: App {

    var body: some Scene {
        WindowGroup {
            LifeCreationView(viewModel: LifeCreationViewModel(randomNumberGenerator: RandomNumberGenerator()))
        }
    }
}
