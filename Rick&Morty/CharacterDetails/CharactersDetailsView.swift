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
    @ViewBuilder private var status: some View {
        Text("Alive")
    }
    @ViewBuilder private var image: some View {
        if let imageURL = URL(string: viewModel.characterImage) {
            WebImage(url: imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .shadow(radius: 10)
        } else {
            Text("Invalid image URL")
        }
    }
    @ViewBuilder private var gender: some View {
        Text(viewModel.characterGender)
    }
    @ViewBuilder private var origin: some View {
        Text("origin")
    }
    @ViewBuilder private var location: some View {
        Text("location")
    }
    var body: some View {
        ZStack{
            VStack{
                image
                header
                status
                gender
                origin
                location
                ListEpisode(viewModel: viewModel.listEpisodeViewModel())
            }
        }        .onAppear() {
            viewModel.onViewAppeared()
        }
    }
}
//#Preview {
//    CharactersDetailsView()
//}
