//
//  ListEpisodeViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation
typealias EpisodeUrl = String

class ListEpisodeViewModel: ObservableObject {
    private let apiProvider: MortyAPIService
    @Published var episodeUrls: [EpisodeUrl]
    var headerTitle:String {
        "Lista odcinków:"
    }
    init(episodeUrls: [EpisodeUrl], apiProvider: MortyAPIService) {
        self.episodeUrls = episodeUrls
        self.apiProvider = apiProvider
    }
    @MainActor
    func episodeDetailsViewModel(episodeUrl: EpisodeUrl) -> EpisodeDetailsViewModel {
        EpisodeDetailsViewModel(episodeUrl: episodeUrl, apiProvider: apiProvider)
    }
    func episodeCellViewModel(episodeUrl: EpisodeUrl) -> EpisodeCellViewModel {
        EpisodeCellViewModel(episodeUrl: episodeUrl)
    }
}
