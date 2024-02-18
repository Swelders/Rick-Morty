//
//  EpisodeViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class EpisodeCellViewModel: ObservableObject {
    private let episodeUrl: EpisodeUrl
    
    var episodeName: String {
        let components = episodeUrl.components(separatedBy: "/")
        if let episodeNumberString = components.last,
           let episodeNumber = Int(episodeNumberString) {
            return "Odcinek \(episodeNumber)"
        } else {
            return "Unknown Episode"
        }
    }
    
    init(episodeUrl: EpisodeUrl) {
        self.episodeUrl = episodeUrl
    }
}
