//
//  SwiftUICS193PApp.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 1/5/23.
//

import SwiftUI

@main
struct SwiftUICS193PApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(
            viewModel: game
            )
        }
    }
}
