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
    let status: String
    let gender: String
    let location: Location
    let origin: Origin
    let episode: [EpisodeUrl]
    let image: String
}
struct Location: Decodable, Hashable {
    let name:String
    let url:String
}
struct Origin: Decodable, Hashable  {
    let name:String
    let url:String
}


