//
//  CharacterCellViewModel.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 18/02/2024.
//

import Foundation
class CharacterCellViewModel: ObservableObject {
    private let character: Character
    
    var characterName: String {
        character.name
    }
    
    var characterImage: String {
        character.image
    }
    
    init(character: Character) {
        self.character = character
    }
}
