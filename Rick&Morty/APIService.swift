//
//  ServiceProvider.swift
//  Rick&Morty
//
//  Created by Jakub Grzegorski on 17/02/2024.
//

import Foundation
import Combine


enum APIError: Error {
    case invalidURL
}

struct CharacterListResponse: Decodable {
    let results: [Character]
}

class MortyAPIService {
    func getCharacters() async throws -> [Character] {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(CharacterListResponse.self, from: data)
        return response.results
    }
    func getEpisodeDetails(episodeUrl: EpisodeUrl) async throws -> Episode {
        guard let url = URL(string: episodeUrl) else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(Episode.self, from: data)
        return response
    }
}
