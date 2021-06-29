//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by stenio on 09/06/21.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
   @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🧙🏿‍♀️","🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count)   { pairIndex in
            return emojis[pairIndex]
        }
    }
        
      
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
