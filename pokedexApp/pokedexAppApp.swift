//
//  pokedexAppApp.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import SwiftUI

@main
struct pokedexAppApp: App {
    var body: some Scene {
        WindowGroup {
            PokedexView()
                .environmentObject(PokemonService())
        }
    }
}
