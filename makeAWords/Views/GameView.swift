//
//  GameView.swift
//  makeAWords
//
//  Created by Peter Clarke on 28.01.2023.
//

import SwiftUI

struct GameView: View {
    
    @State var startView = false
    
    var body: some View {
        VStack{
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            Button {
                startView.toggle()
            } label: {
                Text("Вернуться в меню")
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .padding()
                    .background(Color("firstPlayer"))
                    .cornerRadius(20)
            }

        }
        .fullScreenCover(isPresented: $startView) {
            StartView()
        }
        
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
