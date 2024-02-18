//
//  EpisodeDetailsView.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI

struct EpisodeDetailsView: View {
    
    @ObservedObject var viewModel: EpisodeDetailsViewModel
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.8)
                .ignoresSafeArea()
            VStack {
                Text("Episode \(viewModel.episodeId) details.")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom, 250)
                VStack(alignment:.leading){
                    HStack {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        Text(viewModel.episodeName)
                    }
                    .font(.title3)
                    .padding()
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text(viewModel.episodeAirDate)
                    }
                    .font(.title3)
                    .padding()
                    
                    HStack {
                        Image(systemName: "barcode")
                        Text(viewModel.episodeEpisode)
                    }
                    .font(.title3)
                    .padding()
                }
                .frame(width: 300, height: 220, alignment: .center)
                .background(Color.gray.opacity(1.0))
                .cornerRadius(15.0)
                .padding(.horizontal, 30)
                
            }
        }.onAppear {
            viewModel.onViewAppeared()
        }
    }
}
