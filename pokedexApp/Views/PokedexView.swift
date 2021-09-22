//
//  PokedexView.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import SwiftUI

struct PokedexView: View {
    
    @EnvironmentObject var pokemons: PokemonService
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
      ]
    
    var body: some View {
        NavigationView{
            ScrollView(showsIndicators: false){
                LazyVGrid(columns:columns, spacing:15){
                    ForEach($pokemons.pokemonArr){$pk in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: $pk)){
                            CardView(pokemon: $pk)

                        }
                       
                    }
                }
            }
            .navigationTitle("Pokedex")
        }.accentColor(.white)
            .navigationViewStyle(StackNavigationViewStyle())

        .alert(item: $pokemons.errorMsg){ error in
            Alert(title: Text("Error"), message: Text(error.message.messageError))
        }
        
        
        
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
            .environmentObject(PokemonService())
    }
}
