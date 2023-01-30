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
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                //.frame(width: .infinity, height: .infinity)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 16){
                
                Text("Магнитотерапия")
                    .font(.custom("AvenirNext-Bold", size: 36))
                    .foregroundColor(Color.white)
                
                
                HStack(spacing: 12){
                    
                    VStack{
                        
                        Text("0")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 65))
                        Text("Vasya")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 24))
                    }
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 4.5)
                    .background(Color("firstPlayer"))
                    .cornerRadius(25)
                    VStack{
                        Text("0")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 65))
                        Text("Petya")
                            .foregroundColor(.white)
                            .font(.custom("AvenirNext-Bold", size: 24))
                    }
                    .padding(20)
                    .frame(width: UIScreen.main.bounds.width / 2.5 , height: UIScreen.main.bounds.height / 4.5)
                    .background(Color("secondPlayer"))
                    .font(.custom("AvenirNext-Bold", size: 24))
                    .cornerRadius(25)
                    
                    
                    
                }
                BigWordTextField(word: $word, placeHolder: "Ваше слово...")
                    .padding(.horizontal)
                
                Button {
                    print("Done")
                    self.word = ""
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

                
            }
            .fullScreenCover(isPresented: $startView, content: {
                StartView()
            })
        }
        
        List{
            
        }
        .listStyle(.plain)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
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
        GameView()
        
    }
}
