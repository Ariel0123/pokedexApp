//
//  PokemonDetailView.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @Binding var pokemon: PokemonList

    @State var tab = true
    
    @State var setMainColor = Color.clear
    
    
    var body: some View {
        ZStack{
            self.setMainColor
                .ignoresSafeArea()
            
            
            VStack{
                
            VStack{
                ImageCache(pokemon.imageUrl)
                    .frame(width: 250, height: 250, alignment: .center)
                    .background(
                        Circle()
                            .foregroundColor(Color.white.opacity(0.3))
                            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    )
            
            }
                
            Spacer()
                
            VStack{
                Text(pokemon.name.capitalized)
                    .font(.title)
                    .bold()
                    .padding(.bottom, 20)
                    .foregroundColor(.black)

                
                Text(pokemon.type.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .background(
                        GeometryReader { geo in
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(self.setMainColor)
                            .frame(width: geo.size.width+10, height: geo.size.height+10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .offset(x: -5, y: -5)
                        }
                    )
                
                
                Text(String(pokemon.description).removeN())
                    .font(.caption)
                    .padding()
                    .foregroundColor(.black)

                
                
                
                VStack{
                    HStack{
                        
                        Button(action: {

                            if !self.tab{
                                self.tab.toggle()
                            }
                           
                        }, label: {
                            Text("Stats")
                                .font(.subheadline)
                                .foregroundColor(self.tab ? .white : self.setMainColor)
                        })
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(self.tab ? self.setMainColor : .clear)
                                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
                        )
                        .animation(.default)

                        
                        Spacer()
                        
                        Button(action: {
                            if self.tab{
                                self.tab.toggle()
                            }
                            
                        }, label: {
                            Text("Evolutions")
                                .font(.subheadline)
                                .foregroundColor(self.tab ? self.setMainColor : .white)

                        })
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(self.tab ? .clear : self.setMainColor)
                                .frame(width: 100, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)

                        )
                        .animation(.default)

                       
                    }.padding(.horizontal, 100)
                    .padding(.vertical, 10)
                    
                    
            
                    if self.tab{
                        StatsView(attack: $pokemon.attack,
                                  defense: $pokemon.defense,
                                  height: $pokemon.height,
                                weight: $pokemon.weight,
                                colorBar: $setMainColor)
                                .padding()
                                .padding(.bottom,40)
                    }else{
                        EvolutionsView(evos: $pokemon.evolutionChain, colorBar: $setMainColor)
                            .padding()
                            .padding(.bottom,18)

                    }
                   
                }
                
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  maxHeight:450)
            .background(Color.white)
            .cornerRadius(40, corners: [.topLeft, .topRight])
                
            }
            .padding(.top, 100)
            .ignoresSafeArea()
        }
        .onAppear{
            DispatchQueue.main.async {
            self.setMainColor = Color.backgroundColorPokemon(forType: pokemon.type)
            }
        }
    }
    
    
  
    
    
}




struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: .constant(PokemonList(id: 0, name: "", imageUrl: "", type: "", attack: 0, defense: 0, weight: 0, height: 0, description: "", evolutionChain: [Evolution(id: "", name: "")])))
    }
}
