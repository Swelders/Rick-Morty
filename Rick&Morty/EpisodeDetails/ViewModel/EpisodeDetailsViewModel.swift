//
//  EpisodeDetailsViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation
@MainActor
class EpisodeDetailsViewModel: ObservableObject {
    @Published private(set) var alertDetails = AlertDetails()
    @Published var showAlert: Bool = false
    private let apiProvider: MortyAPIService
    private let episodeUrl: EpisodeUrl
    @Published var episode: Episode? = nil
    init(episodeUrl: EpisodeUrl, apiProvider: MortyAPIService) {
        self.apiProvider = apiProvider
        self.episodeUrl = episodeUrl
    }
    
    var episodeName: String {
        episode?.name ?? ""
    }
    var episodeAirDate: String {
        episode?.air_date ?? ""
    }
    var episodeEpisode: String {
        episode?.episode ?? ""
    }
    var episodeId: Int {
        episode?.id ?? 0
    }
    @MainActor
    func onViewAppeared() {
        Task {
            do {
                self.episode = try await apiProvider.getEpisodeDetails(episodeUrl: episodeUrl)
            } catch URLError.unsupportedURL {
                showAlert(title: "Error", description: "Wrong URL addres.", buttonText: "OK")
            } catch {
                print("Unknown error:\(error)")
            }
        }
    }
}
extension EpisodeDetailsViewModel {
    func showAlert(title: String, description: String, buttonText: String) {
        let alertDetails = AlertDetails(alertTitle: title, alertMessage: description, alertButtonText: buttonText)
        self.alertDetails = alertDetails
        showAlert = true
    }
}

