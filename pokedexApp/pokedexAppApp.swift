//
//  pokedexAppApp.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import SwiftUI

@main
struct pokedexAppApp: App {
    
    @StateObject private var pokemonService = PokemonService()
    
    var body: some Scene {
        WindowGroup {
            PokedexView()
                .environmentObject(pokemonService)
        }
    }
}
