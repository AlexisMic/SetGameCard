//
//  CardView.swift
//  SetGameCard
//
//  Created by Alexis Schotte on 8/16/22.
//

import SwiftUI

struct CardView: View {
    
    let cardNumber: CardNumber
    let cardShading: CardShading
    let cardColor: Color
    let cardShape: CardShape
        
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
        ZStack {
            shape
                .fill()
                .foregroundColor(.white)
            shape
                .strokeBorder(lineWidth: 3)
            cardContent
        }
        .frame(width: 100, height: 150)
            
    }
    
    private var cardContent: some View {
        VStack {
            ForEach(0..<cardNumber.rawValue) { _ in
                Text("Hi")
            }
        }
        
    }
}


struct DrawingConstants {
    static let cornerRadius: CGFloat = 5
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardNumber: CardNumber.two, cardShading: CardShading.solid, cardColor: .blue, cardShape: CardShape.rectangle)
    }
}
