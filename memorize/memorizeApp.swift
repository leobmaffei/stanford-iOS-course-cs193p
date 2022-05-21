//
//  memorizeApp.swift
//  memorize
//
//  Created by Leonardo Bonetti Maffei on 13/05/22.
//

import SwiftUI

@main
struct memorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
