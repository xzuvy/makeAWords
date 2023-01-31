//
//  GameView.swift
//  makeAWords
//
//  Created by Peter Clarke on 28.01.2023.
//

import SwiftUI

struct GameView: View {
    
    @State var startView = false
    @State private var word = ""
    var viewModel : GameViewModule
    
    var body: some View {
        
            
            
            VStack(spacing: 16){
                Spacer()
                Text(viewModel.word)
                    .font(.custom("AvenirNext-Bold", size: 36))
                    .foregroundColor(Color.white)
                
                
                HStack(spacing: 12){
                    
                    VStack{
                        
                        Text("\(viewModel.playerOne.score)")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 65))
                        Text("\(viewModel.playerOne.name)")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 24))
                    }
                    .padding(15)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 5.0)
                    .background(Color("firstPlayer"))
                    .cornerRadius(25)
                    VStack{
                        Text("\(viewModel.playerTwo.score)")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 65))
                        Text("\(viewModel.playerTwo.name)")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 24))
                    }
                    .padding(15)
                    .frame(width: UIScreen.main.bounds.width / 2.5 , height: UIScreen.main.bounds.height / 5.0)
                    .background(Color("secondPlayer"))
                    .font(.custom("AvenirNext-Bold", size: 24))
                    .cornerRadius(25)
                    
                    
                    
                }
                BigWordTextField(word: $word, placeHolder: "Ваше слово...")
                    .padding(.horizontal)
                
                Button {
                   let score = viewModel.checkWord(word: word)
                    if score > 0 {
                        self.word = ""
                    }
                    
                } label: {
                    Text("Готово!")
                        .padding(12)
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .frame(maxWidth: .infinity)
                        .background(Color("gameColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                }
                Button {
                    startView.toggle()
                } label: {
                    Text("Выход")
                        .padding(12)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .background(Color("gameColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                List{
                    
                }
                .listStyle(.plain)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                

                
            }
            .background(Image("background"))
            .fullScreenCover(isPresented: $startView, content: {
                StartView()
            })
            
            
        
        
        
        
        }
    
        
        
        
        
    }
    
    
    
    
    


//struct BigWordTextField: View {
//    
//    @State var word : Binding<String>
//    var placeHolder : String
//    
//    var body: some View {
//        TextField(placeHolder, text: word)
//            .font(.system(size: 14))
//            .padding()
//            .background(Color.black)
//            .cornerRadius(12)
//    }
//}
//

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModule(playerOne:
                                            Player(name: "Vasya"),
                                           playerTwo: Player(name: "Fedya"),
                                           word: "Реконосцировка"))
        
    }
}
