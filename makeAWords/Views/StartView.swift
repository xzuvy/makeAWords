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
    @State var isAlertPresented = false
    
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
                
                if word.count > 7{
                    gameView.toggle()
                }
                else{
                    self.isAlertPresented.toggle()
                }
                
                
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
        .alert("Длинное слово слишком короткое",
               isPresented: $isAlertPresented,
               actions: {
            Text("Ok")
        })
        .fullScreenCover(isPresented: $gameView, content: {
            
            let name1 = playerOne == "" ? "Игрок 1" : playerOne
            let name2 = playerTwo == "" ? "Игрок 2" : playerTwo
            
            let playerOne = Player(name: name1)
            let playerTwo = Player(name: name2)
            
            let gameViewModule = GameViewModule(playerOne: playerOne, playerTwo: playerTwo, word: word)
            
            GameView(viewModel: gameViewModule)
        })
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
