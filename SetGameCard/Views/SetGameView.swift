//
//  ContentView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/15/22.
//

import SwiftUI

struct SetGameView: View {
    
    let gameVM: GameViewModel
    
    var body: some View {
        CardView(card: gameVM.cards.first!)
    }
}

struct SetGameView_Previews: PreviewProvider {
    static var previews: some View {
        let gameVMPreview = GameViewModel()
        SetGameView(gameVM: gameVMPreview)
    }
}
