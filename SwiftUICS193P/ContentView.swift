//
//  ContentView.swift
//  SwiftUICS193P
//
//  Created by Khondakar Afridi on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView()
            CardView()
            CardView()
            CardView()
        }.padding(.horizontal)
    }
}

struct CardView : View{
    var body: some View{
            ZStack(
                alignment: .center,
                content: {
                    RoundedRectangle(
                        cornerRadius: 25.0
                    )
                    .stroke(
                        lineWidth: 2
                    )
                    .foregroundColor(
                        Color(
                            hue: 0.55,
                            saturation: 0.924,
                            brightness: 0.798
                        )
                    )
                    RoundedRectangle(
                        cornerRadius: 25.0
                    )
                    .fill()
                    .foregroundColor(
                        .white
                    )
                    Text("✈️")
                        .font(.largeTitle)
                        .foregroundColor(Color.pink)
                        .multilineTextAlignment(.center)
                }
            )
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
