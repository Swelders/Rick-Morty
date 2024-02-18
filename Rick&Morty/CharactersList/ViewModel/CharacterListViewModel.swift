//
//  CharacterListViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation
import SwiftUI

class AlertDetails: ObservableObject {
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var alertButtonText = ""
    
    init(alertTitle: String = "", alertMessage: String = "", alertButtonText: String = "") {
        self.alertTitle = alertTitle
        self.alertMessage = alertMessage
        self.alertButtonText = alertButtonText
    }
}
class CharacterListViewModel: ObservableObject {
    
    @Published private(set) var alertDetails = AlertDetails()
    @Published var showAlert: Bool = false
    
    @MainActor @Published private(set) var characters: [Character] = [] // Dodanie pola character
    private let apiProvider: MortyAPIService
    
    init(apiProvider:MortyAPIService) {
        self.apiProvider = apiProvider
    }
    
    @MainActor
    func onViewAppeared() {
        Task {
            do {
                self.characters = try await apiProvider.getCharacters()
            } catch URLError.unsupportedURL {
                showAlert(title: "Error", description: "Wrong URL addres.", buttonText: "OK")
            } catch {
                print("Unknown error:\(error)")
            }
        }
    }
    func detailViewModel(character: Character) -> CharactersDetailsViewModel {
        CharactersDetailsViewModel(character: character, apiProvider: apiProvider)
    }
    func characterCellViewModel(character: Character) -> CharacterCellViewModel {
        CharacterCellViewModel(character: character)
    }
}

extension CharacterListViewModel {
    func showAlert(title: String, description: String, buttonText: String) {
        let alertDetails = AlertDetails(alertTitle: title, alertMessage: description, alertButtonText: buttonText)
        self.alertDetails = alertDetails
        showAlert = true
    }
}
