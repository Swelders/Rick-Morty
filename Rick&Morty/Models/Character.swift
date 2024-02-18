//
//  CharacterList.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

struct Character: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let gender: String
    let image: String
    let episode: [String]
}



