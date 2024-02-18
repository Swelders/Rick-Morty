//
//  CharactersDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class CharactersDetailsViewModel: ObservableObject, Identifiable {
    private let apiProvider: MortyAPIService
    private let character: Character
    @Published private(set) var alertDetails = AlertDetails()
    @Published var showAlert: Bool = false
    @MainActor @Published private(set) var episodes: [Episode] = []
    
    var episodesNames: [String] {
        character.episode
    }
    var characterName: String {
        character.name
    }
    
    var characterImage: String {
        character.image
    }
    var  characterGender: String
    {
        "Gender: \(character.gender)"
    }
    var  characterOrigin: String
    {
        "Origin: \(character.origin.name)"
    }
    var characterLocation: String
    {
        "Location: \(character.location.name)"
    }
    var characterStatus: String
    {
        "Status: \(character.status)"
    }
    
    init(character: Character, apiProvider:MortyAPIService) {
        self.character = character
        self.apiProvider = apiProvider
    }
    
    @MainActor func listEpisodeViewModel() -> ListEpisodeViewModel {
        ListEpisodeViewModel(episodeUrls: character.episode, apiProvider: apiProvider)
    }
}

extension CharactersDetailsViewModel {
    func showAlert(title: String, description: String, buttonText: String) {
        let alertDetails = AlertDetails(alertTitle: title, alertMessage: description, alertButtonText: buttonText)
        self.alertDetails = alertDetails
        showAlert = true
    }
}



