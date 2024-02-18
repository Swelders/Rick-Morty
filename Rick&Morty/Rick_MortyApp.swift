//
//  Rick_MortyApp.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI

@main
struct Rick_MortyApp: App {
    var body: some Scene {
        WindowGroup {
            let mortyAPIProvider =  MortyAPIService()
            let viewModel = CharacterListViewModel(apiProvider:mortyAPIProvider)
            NavigationView {
                CharacterListView(viewModel: viewModel)
            }
        }
    }
}
