//
//  CharactersDetailsView.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharactersDetailsView: View {
    
    @ObservedObject var viewModel: CharactersDetailsViewModel
    
    init(viewModel: CharactersDetailsViewModel) {
        self.viewModel = viewModel
    }
    @ViewBuilder private var header: some View {
        Text(viewModel.characterName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            .padding(.vertical, 30)
    }
    
    @ViewBuilder private var image: some View {
        if let imageURL = URL(string: viewModel.characterImage) {
            WebImage(url: imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10)
                .cornerRadius(10)
        } else {
            Text("Invalid image URL")
        }
    }
    @ViewBuilder private var status: some View {
        Text(viewModel.characterStatus)
    }
    @ViewBuilder private var gender: some View {
        Text(viewModel.characterGender)
    }
    @ViewBuilder private var origin: some View {
        Text(viewModel.characterOrigin)
    }
    @ViewBuilder private var location: some View {
        Text(viewModel.characterLocation)
    }
    var body: some View {
        ZStack{
            ScrollView {
                VStack{
                    image
                    header
                    VStack(alignment: .leading) {
                        Divider()
                            .frame(height: 3)
                        status
                        gender
                        origin
                        location
                    }.padding(5)
                        .font(.title2)
                    Divider()
                        .frame(height: 3)
                    ListEpisode(viewModel: viewModel.listEpisodeViewModel())
                }.padding()
            }
            .background(Color.gray.opacity(0.3))
        }
    }
}

