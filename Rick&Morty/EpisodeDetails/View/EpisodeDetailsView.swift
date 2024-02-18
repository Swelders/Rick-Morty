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
        Text("\(viewModel.episodeName)")
      //  Text("\(viewModel.episodeEpisode)")
       // Text("\(viewModel.episodeAirDate)")
    }
}
