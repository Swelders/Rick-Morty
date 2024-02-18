//
//  ListEpisode.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI

struct ListEpisode: View {
    @ObservedObject var viewModel: ListEpisodeViewModel
    var body: some View {
        Text(viewModel.headerTitle)
            .font(.title)
        VStack {
            ForEach(viewModel.episodeUrls, id: \.self) { episodeUrl in
                Divider()
                    .frame(height: 2)
                NavigationLink(destination: EpisodeDetailsView(viewModel: viewModel.episodeDetailsViewModel(episodeUrl: episodeUrl))) {
                    EpisodeCellView(viewModel: viewModel.episodeCellViewModel(episodeUrl: episodeUrl))
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                }
            }
        }
        .foregroundColor(.black)
    }
}
