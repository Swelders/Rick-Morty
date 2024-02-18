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
        HStack{
            List(viewModel.episodes, id: \.self) { episode in
                NavigationLink(destination: EpisodeDetailsView(viewModel: viewModel.episodeDetailsViewModel(episode: episode))) {
                    EpisodeCellView(viewModel: viewModel.episodeCellViewModel(episode: episode))
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .listStyle(PlainListStyle())
            .listRowSeparator(.hidden)
            .listRowBackground(Color(.brown).opacity(0.1))
        }
    }
}
