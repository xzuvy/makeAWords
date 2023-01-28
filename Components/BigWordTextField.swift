//
//  BigWordTextField.swift
//  makeAWords
//
//  Created by Peter Clarke on 28.01.2023.
//

import SwiftUI

struct BigWordTextField: View {
    
    @State var word : Binding<String>
    var placeHolder : String
    
    var body: some View {
        TextField(placeHolder, text: word)
            .font(.title2)
            .padding()
            .background(.white)
            .cornerRadius(12)
    }
}
