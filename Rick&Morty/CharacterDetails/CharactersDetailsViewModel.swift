//
//  CharactersDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

class CharactersDetailsViewModel: ObservableObject, Identifiable {
    @Published private(set) var alertDetails = AlertDetails()
    @Published var showAlert: Bool = false
    @MainActor @Published private(set) var episodes: [Episode] = []
    private let character: Character
    var episodesNames: [String] {
        character.episode
    }
    
    private let apiProvider: MortyAPIService
    
    var characterName: String {
        character.name
    }
    
    var characterImage: String {
        character.image
    }
    var  characterGender: String
    {
        character.gender
    }
    init(character: Character, apiProvider:MortyAPIService) {
        self.character = character
        self.apiProvider = apiProvider
    }

    @MainActor func listEpisodeViewModel() -> ListEpisodeViewModel {
        ListEpisodeViewModel(episodes: episodes)
    }
    
    @MainActor
    func onViewAppeared() {
        Task {
            do {
                self.episodes = try await apiProvider.getEpisodes()
                print("Jesteśmy w ViewModelu")
            } catch URLError.unsupportedURL {
                print("url error")
                showAlert(title: "Error", description: "Wrong URL addres.", buttonText: "OK")
            } catch {
                print("Unknown error:\(error)")
            }
        }
    }
}

extension CharactersDetailsViewModel {
    func showAlert(title: String, description: String, buttonText: String) {
        let alertDetails = AlertDetails(alertTitle: title, alertMessage: description, alertButtonText: buttonText)
        self.alertDetails = alertDetails
        showAlert = true
    }
}



