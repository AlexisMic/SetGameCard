//
//  Card.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

struct Card {
    
    let id: Int
    let cardNumber: CardNumber
    let cardShading: CardShading
    let cardColor: Color
    let cardShape: CardShape
    let isSelected: Bool
    let isMatched: Bool
    
}

enum CardNumber: Int, CaseIterable {
    case one = 1, two, three
}

enum CardShading: Double, CaseIterable {
    case solid = 0, striped = 0.5, open = 1.0
}

enum CardShape: CaseIterable {
    case diamond, rectangle, oval
}
