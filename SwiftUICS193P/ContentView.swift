//
//  ContentView.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var vehicles = [  "🚗",  "🚕",  "🚙",  "🚌",  "🚎",  "🏎️",  "🚓",  "🚑",  "🚒",  "🚐",  "🚚",  "🚛",  "🚜",  "🛴",  "🚲",  "🏍️",  "🛵",  "🛺",  "🚍",  "🚘",  "🚖",  "🚔",  "🚂",  "🚆"]
    
    @State var emojiCount = 3
    
    var body: some View {
        VStack{
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
                        vehicles[0...emojiCount],
                        id: \.self,
                        content: {
                            vehicle in
                            CardView(
                                isFaceUp: true,
                                content: vehicle
                            ).aspectRatio(
                                2/3,
                                contentMode: .fit
                            )
                        }
                    )
                }.padding(.all)
            }
            Spacer()        }
    }
}

struct CardView : View{
    @State var isFaceUp : Bool = false
    var content : String
    var body: some View{
            ZStack(
                alignment: .center,
                content: {
                    let shape = RoundedRectangle(
                    cornerRadius: 20
                    )
                    if(isFaceUp){
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
                        Text(content)
                            .font(.largeTitle)
                        .foregroundColor(Color.pink)
                        .multilineTextAlignment(.center)
                    }else{
                        shape
                        .fill()
                        .foregroundColor(
                            .cyan
                        )
                    }
                }
            ).onTapGesture {
                isFaceUp = !isFaceUp
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
