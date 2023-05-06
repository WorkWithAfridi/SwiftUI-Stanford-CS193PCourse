//
//  ContentView.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        ScrollView{
            LazyVGrid(
                columns: [
                    GridItem(
                        .adaptive(
                            minimum: 80
                        )
                    )
                ]
            ){
                ForEach(
                    viewModel.cards,
                    content: {
                        card in
                        CardView(
                            card: card
                        ).aspectRatio(
                            2/3,
                            contentMode: .fit
                        ).onTapGesture {
                            viewModel.choose(card)
                        }
                    }
                )
            }.padding(.all)
        }
    }
}

struct CardView : View{
    let card: MemoryGame<String>.Card
    
    var body: some View{
            ZStack(
                alignment: .center,
                content: {
                    let shape = RoundedRectangle(
                    cornerRadius: 20
                    )
                    if(card.isFaceUp){
                        shape
                        .stroke(
                            lineWidth: 3
                        )
                        .foregroundColor(
                            Color(
                                hue: 0.55,
                                saturation: 0.924,
                                brightness: 0.798
                            )
                        )
                        shape
                        .fill()
                        .foregroundColor(
                            .white
                        )
                        Text(card.content)
                            .font(.largeTitle)
                        .foregroundColor(Color.pink)
                        .multilineTextAlignment(.center)
                    } else if(card.isMatched){
                        shape.opacity(0)
                    }else{
                        shape
                        .fill()
                        .foregroundColor(
                            .cyan
                        )
                    }
                }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
   static let game = EmojiMemoryGame()
    static var previews: some View {
        ContentView(
        viewModel: game
        )
            .preferredColorScheme(.light)
        ContentView(
        viewModel: game
        )
        .preferredColorScheme(.dark)
    }
}
