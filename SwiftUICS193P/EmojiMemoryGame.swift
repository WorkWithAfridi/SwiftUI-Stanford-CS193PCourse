//
//  EmojiMemoryGame.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 4/5/23.
//

import SwiftUI

func makeCardContent(index: Int)->String{
    return "✌🏼"
}

class EmojiMemoryGame : ObservableObject{
    static let vehicles = [  "🚗",  "🚕",  "🚙",  "🚌",  "🚎",  "🏎️",  "🚓",  "🚑",  "🚒",  "🚐",  "🚚",  "🚛",  "🚜",  "🛴",  "🚲",  "🏍️",  "🛵",  "🛺",  "🚍",  "🚘",  "🚖",  "🚔",  "🚂",  "🚆"]
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(
        numberOfPairsOfCards: 4,
        createCardContent: {
            pairIndex in EmojiMemoryGame.vehicles[pairIndex]
         }
        )
    }

    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
//        objectWillChange.send()
        model.choose(card)
    }
}
