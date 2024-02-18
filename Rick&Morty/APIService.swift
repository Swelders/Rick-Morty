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
struct EpisodeListResponse: Decodable {
    let results: [Episode]
}

class MortyAPIService {
        func getCharacters() async throws -> [Character] {
            print("getCharacters fetched")
            guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
               throw APIError.invalidURL
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let response = try decoder.decode(CharacterListResponse.self, from: data)
            return response.results
    }
    func getEpisodes() async throws -> [Episode] {
        print("getEpisode fetched")
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            throw APIError.invalidURL
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let response = try decoder.decode(EpisodeListResponse.self, from: data)
        return response.results
    }
}
