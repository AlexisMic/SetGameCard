//
//  CardView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
        
    var body: some View {
        
        let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        ZStack {
            cardShape
                .fill()
                .foregroundColor(.white)
            cardShape
                .strokeBorder(lineWidth: 3)
            cardContent
        }
        .frame(width: 100, height: 150)
            
    }
    
    private var cardContent: some View {
        VStack {
            ForEach(0..<card.cardNumber.rawValue) { _ in
                ZStack {
                    switch card.cardShape {
                    case .diamond:
                        Diamond()
                    case .rectangle:
                        Rectangle()
                    case .oval:
                        Oval()
                    }
                }
                .foregroundColor(card.cardColor)
                .opacity(card.cardShading.rawValue)
                .aspectRatio(DrawingConstants.aspectRatio, contentMode: .fit)
                .padding(.vertical, DrawingConstants.paddingVertical)
                .padding(.horizontal, DrawingConstants.paddingHorizontal)
            }
        }
    }
}


struct DrawingConstants {
    static let cornerRadius: CGFloat = 5
    static let aspectRatio: CGFloat = 2
    static let paddingVertical: Double = 6
    static let paddingHorizontal: Double = 2
    
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = Card(id: 1, cardNumber: CardNumber.two, cardShading: CardShading.striped, cardColor: .red, cardShape: CardShape.oval, isSelected: false, isMatched: false)
        CardView(card: card)
    }
}
