//
//  CharakterListViev.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterListView: View {
    
    @ObservedObject private var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        
        VStack {
            if !viewModel.characters.isEmpty {
                List(viewModel.characters, id: \.self) { character in
                    let characterDetailsViewModel = viewModel.detailViewModel(character: character)
                    NavigationLink(destination: CharactersDetailsView(viewModel: characterDetailsViewModel)) {
                        CharacterCell(viewModel: viewModel.characterCellViewModel(character: character))
                            .padding()
                    }
                }
            } else {
                Text("Brak postaci")
            }
            
        }
        .alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text(viewModel.alertDetails.alertTitle),
                  message: Text(viewModel.alertDetails.alertMessage),
                  dismissButton: .default(Text(viewModel.alertDetails.alertButtonText)))
        }
        .onAppear() {
            viewModel.onViewAppeared()
        }
    }
}

