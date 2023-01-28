//
//  ContentView.swift
//  makeAWords
//
//  Created by Peter Clarke on 28.01.2023.
//

import SwiftUI

struct StartView: View {
    
    @State var word = ""
    @State var playerOne = ""
    @State var playerTwo = ""
    @State var gameView = false
    
    var body: some View {
        VStack{
            
            TitleText(text: "Игра в слова")
            
            BigWordTextField(word: $word, placeHolder: "Введите большое слово")
                .padding(20)
                .padding(.top,32)
            
            BigWordTextField(word: $playerOne, placeHolder: "Имя первого игрока")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            BigWordTextField(word: $playerTwo, placeHolder: "Имя второго игрока")
                .cornerRadius(12)
                .padding(.horizontal, 20)
            
            Button {
                gameView.toggle()
            } label: {
                Text("Начать")
                    .padding()
                    .font(.custom("AvenirNext-Bold", size: 35))
                    .foregroundColor(.white)
                    .background(Color("firstPlayer"))
                    .cornerRadius(20)
                    .padding(.top, 80)
                
            }

                
        }
        .background(Image("background"))
        .fullScreenCover(isPresented: $gameView) {
            GameView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
