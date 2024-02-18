//
//  ListItem.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI

struct ListCharacter: View {

    
    var body: some View {
        HStack{
            Image("Rick")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .cornerRadius(3.0)
                .padding()
            Text("Rick Sanchez")
                .bold()
                .padding()
            Spacer()
        }
    }
}

#Preview {
    ListCharacter()
}
