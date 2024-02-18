//
//  Episode.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation

struct Episode: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
}



