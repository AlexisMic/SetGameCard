//
//  SetGameCardApp.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/15/22.
//

import SwiftUI

@main
struct SetGameCardApp: App {
    private let viewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            SetGameView(gameVM: viewModel)
        }
    }
}
