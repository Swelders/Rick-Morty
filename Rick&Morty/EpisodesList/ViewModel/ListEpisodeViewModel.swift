//
//  ListEpisodeViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class ListEpisodeViewModel: ObservableObject {
    @Published var episodes: [Episode]
    
    init(episodes: [Episode]) {
        self.episodes = episodes
    }
    
    func episodeDetailsViewModel(episode: Episode) -> EpisodeDetailsViewModel {
        EpisodeDetailsViewModel(episode: episode)
    }
    func episodeCellViewModel(episode: Episode) -> EpisodeCellViewModel {
        EpisodeCellViewModel(episode: episode)
    }
}
