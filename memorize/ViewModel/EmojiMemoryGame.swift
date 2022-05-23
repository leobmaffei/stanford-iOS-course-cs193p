//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Leonardo Bonetti Maffei on 19/05/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
