//
//  PokemonList.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import Foundation

struct PokemonList: Codable, Identifiable{
    var id: Int
    var name: String
    var imageUrl: String
    var type: String
    var attack: Int
    var defense: Int
    var weight: Int
    var height: Int
    var description: String
    var evolutionChain: [Evolution]!
}

struct Evolution: Codable, Identifiable {
  
    var id: String
    var name: String
}

