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
    @State private var confirmPresent = false
    @State private var isAlertPresent = false
    @State var alertText = ""
    
    @Environment(\.dismiss) var dismiss
    
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
                    .shadow(color: viewModel.isFirst ? .blue : .clear, radius: 4)
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
                    .shadow(color: viewModel.isFirst ?  .clear : .purple, radius: 4)
                    
                    
                    
                }
                BigWordTextField(word: $word, placeHolder: "???????? ??????????...")
                    .padding(.horizontal)
                
                Button {
                    
                    var score = 0
                    
                    do{
                        try score = viewModel.checkWord(word: word)
                    } catch WordError.beforeWord{
                        alertText = "???????????????? ?????????? ?????????? ?????????????? ???? ???????? ???????????????????? ??????????"
                        isAlertPresent.toggle()
                    } catch WordError.littleWord{
                        alertText = "?????????????? ???????????????? ??????????"
                        isAlertPresent.toggle()
                    } catch WordError.theSameWord{
                        alertText = "???????????????????????? ?????????? ???? ???????????? ???????? ?? ???????????????? ????????????"
                        isAlertPresent.toggle()
                    } catch WordError.wrongWord{
                        alertText = "?????????? ?????????? ???? ?????????? ???????? ????????????????????"
                        isAlertPresent.toggle()
                    } catch{
                        alertText = "?????????????????????? ????????????"
                        isAlertPresent.toggle()
                    }
                        
                    
                    if score > 0 {
                        self.word = ""
                    }
                    
                } label: {
                    Text("????????????!")
                        .padding(12)
                        .font(.custom("AvenirNext-Bold", size: 26))
                        .frame(maxWidth: .infinity)
                        .background(Color("gameColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .padding(.horizontal)
                }
                Button {
                    
                    confirmPresent.toggle()
                } label: {
                    Text("??????????")
                        .padding(12)
                        .font(.custom("AvenirNext-Bold", size: 20))
                        .background(Color("gameColor"))
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                List{
                   
                    ForEach(0 ..< self.viewModel.words.count, id: \.description){
                        item in
                        WordCell(word: self.viewModel.words[item])
                            .background(item % 2 == 0 ? Color("firstPlayer") : Color("secondPlayer"))
                            .listRowInsets(EdgeInsets())
                        
                    }
                }
                .listStyle(.plain)
                

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background").scaledToFill())
            .confirmationDialog("???? ??????????????, ?????? ???????????? ?????????????????? ?????????",
                                isPresented: $confirmPresent,
                                titleVisibility: .visible){
                Button (role : .destructive){
                    self.dismiss()
                } label: {
                    Text("????")
                }
                Button(role : .cancel) {}
                    label: {
                    Text("??????")
                }


            }
            .alert(alertText, isPresented: $isAlertPresent){
            Text("Ok, ??????????")
            }
                                
            .fullScreenCover(isPresented: $startView, content: {
                StartView()
            })

        }

        
    }
    
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModule(playerOne:
                                            Player(name: "Vasya"),
                                           playerTwo: Player(name: "Fedya"),
                                           word: "????????????????????????????"))
        
    }
}
