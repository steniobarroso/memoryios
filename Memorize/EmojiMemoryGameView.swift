//
//  ContentView.swift
//  Memorize
//
//  Created by stenio on 01/06/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel:EmojiMemoryGame
    
//    var emojis = ["👻","👻","🧙🏿‍♀️","🧛🏿‍♂️","📏", "📌" ,"📍", "🧷", "🧵" ,"🧶" ,"🔐", "🔒", "🔓" ,"🔏" ,"🖊" ,"🖋" ,"✒" ,"📝" ,"✏" ,"🖍" ,"🖌", "🔍", "🔎" ,"👚", "👕" ,"🥼"]
    @State var emojisCount = 4
    var body: some View {
        ZStack{
            HStack{
                ForEach(viewModel.cards) { card in
                    CardView(card: card).onTapGesture(perform: {
                        viewModel.choose(card: card)
                    })
            }
        }
            Spacer()
            HStack{
//                remove
//                Spacer()
//                add
              
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
//    var add: some View{
//
//        Button(action:  {
//            if emojisCount > 1 {
//                emojisCount += 1
//            }
//
//        }, label: {
//            Image(systemName: "plus.circle")
//
//        })
//
//    }
//    var remove: some View{
//        Button(action:  {
////            if emojisCount < emojis.count {
////                emojisCount -= 1
////            }
//        }, label: {
//            Image(systemName: "minus.circle")
//
//        });
//    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius:10.0)
            if card.isFaceUp{
            shape
                .fill(Color.white)
            shape
                .stroke(lineWidth: 3.0)
            Text(card.content)
            }else{
                shape
                    .fill()
            }
    }
    
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
//        .onTapGesture{isfaceUp = !isfaceUp}
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
