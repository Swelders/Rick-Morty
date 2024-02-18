//
//  EpisodeDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class EpisodeDetailsViewModel: ObservableObject {
    private let episode: Episode
    init(episode: Episode) {
        self.episode = episode
    }
    
    var episodeName: String {
        episode.name
    }
//    var episodeAirDate: String {
//        episode.air_date
//    }
//    var episodeEpisode: String {
//        episode.episode
//    }
//    
}
