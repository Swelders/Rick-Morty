//
//  WelcomeScreenViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 18/02/2024.
//

import Foundation
class WelcomeScreenViewModel:ObservableObject{
    private let apiProvider:MortyAPIService
    var welcomeTitle:String {
        "Welcome"
    }
    var instructions:String{
                            """
        Press a button below to get character list.
        By pressing a button we call for API.
        """
    }
    var subtitle:String{
        "It's a world of Rick and Morty!"
    }
    init(apiProvider:MortyAPIService) {
        self.apiProvider = apiProvider
    }
    func characterListViewModel() -> CharacterListViewModel {
        CharacterListViewModel(apiProvider: apiProvider)
    }
}
