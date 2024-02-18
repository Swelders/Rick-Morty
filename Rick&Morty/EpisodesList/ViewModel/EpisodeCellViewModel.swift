//
//  EpisodeViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class EpisodeCellViewModel: ObservableObject {
    private let episode: Episode
    
    var episodeName: String {
        return "Odcinek \(episode)"
    }
    
    init(episode: Episode) {
        self.episode = episode
    }
}
