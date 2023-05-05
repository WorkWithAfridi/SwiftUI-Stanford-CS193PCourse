//
//  MemoryGame.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 4/5/23.
//

import Foundation

struct MemoryGame<CardContent>{
    init(numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent){
        cards=Array<Card>()
        // add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards{
            let content : CardContent = createCardContent(pairIndex);
            cards.append(
                Card(
                    content: content
                )
            )
            cards.append(
                Card(
                    content: content
                )
            )

        }
    }
    
    private(set) var cards : Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    struct Card{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
