//
//  MemoryGame.swift
//  memorize
//
//  Created by Leonardo Bonetti Maffei on 19/05/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMetch = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMetch].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMetch].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable {

        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
