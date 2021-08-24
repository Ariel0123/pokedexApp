//
//  CardView.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import SwiftUI
import Kingfisher

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let pokemon: PokemonList
    
    @State var setMainColor = Color.clear

    
    var body: some View {
            ZStack{
                
                VStack(alignment: .leading) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 8)
                        .padding(.leading)
                    
                    
                    
                    HStack{
                        Text(pokemon.type.capitalized)
                            .font(.subheadline).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white.opacity(0.25))
                            )
                            .frame(width: 100, height: 24)
                            
                        
                        KFImage(URL(string: pokemon.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .padding([.bottom, .trailing], 4)
                            .background(
                                Circle()
                                    .foregroundColor(Color.white.opacity(0.3))
                                    .frame(width: 130, height: 130, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .offset(x: 20, y: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    
                            )
                    }
                }  
                    
     
            }
            .background(self.setMainColor)
            .cornerRadius(20)
            .shadow(color: self.setMainColor, radius: colorScheme == .dark ? 0 : 5, x: 0.0, y: 0.0)
            .onAppear{
                DispatchQueue.main.async {
                self.setMainColor = Color.backgroundColorPokemon(forType: pokemon.type)
                }
            }
           
        
        
        
        
    }
    
   
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(pokemon: PokemonList(id: 0, name: "", imageUrl: "", type: "", attack: 0, defense: 0, weight: 0, height: 0, description: "", evolutionChain: [Evolution(id: "", name: "")]))
    }
}
