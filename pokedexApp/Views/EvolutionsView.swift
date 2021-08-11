//
//  EvolutionsView.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/9/21.
//

import SwiftUI

struct EvolutionsView: View {
    
    @Binding var evos: [Evolution]
    
    @Binding var colorBar: Color

    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
        HStack(spacing:20){
            
            ForEach(evos){i in
                Text(i.name)
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 100, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(colorBar)
                .overlay(
                    Circle()
                        .foregroundColor(Color.white.opacity(0.2))
                        .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 30, y: 8)
                )
                .cornerRadius(20)
                
   
            }

        }
        .padding()
        }
    }
}

struct EvolutionsView_Previews: PreviewProvider {
    static var previews: some View {
        EvolutionsView(evos: .constant([Evolution(id: "", name: "")]), colorBar: .constant(.clear))
    }
}
