//
//  MemoryGame.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 4/5/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    init(numberOfPairsOfCards: Int, createCardContent: (Int)-> CardContent){
        cards=Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content : CardContent = createCardContent(pairIndex);
            cards.append(
                Card(
                    content: content,
                    id: pairIndex*2
                )
            )
            cards.append(
                Card(
                    content: content,
                    id: pairIndex*2+1
                )
            )

        }
    }
    
    private(set) var cards : Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {
//          aCardInCardsArray in aCardInCardsArray.id == card.id
            $0.id == card.id
        }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                if(cards[chosenIndex].content == cards[potentialMatchIndex].content){
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard=nil
            }else{
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()        }
    }
    
    struct Card : Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
