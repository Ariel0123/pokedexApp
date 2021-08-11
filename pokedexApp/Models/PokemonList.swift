//
//  PokemonList.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import Foundation

struct PokemonList: Codable, Identifiable{
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let attack: Int
    let defense: Int
    let weight: Int
    let height: Int
    let description: String
    let evolutionChain: [Evolution]?
}

struct Evolution: Codable, Identifiable {
  
    let id: String
    let name: String
}

