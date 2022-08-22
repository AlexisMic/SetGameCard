//
//  Extensions.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/22/22.
//

import SwiftUI


extension View {
    func cardify(this card: Card) -> some View {
        self.modifier(Cardify(card: card))
    }
}
