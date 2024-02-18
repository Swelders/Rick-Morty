//
//  ListItem.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI


struct CharacterCell: View {
    @ObservedObject var viewModel: CharacterCellViewModel
    
    @ViewBuilder private var image: some View {
        if let imageURL = URL(string: viewModel.characterImage) {
            WebImage(url: imageURL)
                .resizable()
                .frame(width: 60, height: 60)
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10)
        } else {
            Text("Invalid image URL")
        }
    }
    var body: some View {
        HStack{
            image
            Text(viewModel.characterName)
                .bold()
                .padding()
            Spacer()
        }
    }
}

