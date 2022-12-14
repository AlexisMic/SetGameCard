//
//  Card.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

let possibleColors = [Color.red, Color.blue, Color.green]

struct Card: Identifiable {
    
    let id: Int
    let cardNumber: CardNumber
    let cardShading: CardShading
    let cardColor: Color
    let cardShape: CardShape
    var isRemoved = false
    var isSelected = false
    var isMatched = false
    var isDistributed = false
    var isWronglySelected = false
}

enum CardNumber: Int, CaseIterable {
    case one = 1, two, three
}

enum CardShading: Double, CaseIterable {
    case solid = 1, striped = 0.5, open = 0
}

enum CardShape: String, CaseIterable {
    case diamond, rectangle, oval
}
