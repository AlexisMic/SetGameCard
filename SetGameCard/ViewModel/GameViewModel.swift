//
//  GameViewModel.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/17/22.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    
    var model = SetGame()
    
    var cards: Array<Card> {
        model.cards
    }
    
}
