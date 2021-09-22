//
//  StatsView.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/9/21.
//

import SwiftUI

struct StatsView: View {

    @Binding var attack: Int
    @Binding var defense: Int
    @Binding var height: Int
    @Binding var weight: Int
    
    @Binding var colorBar: Color
    
    
    var body: some View {
        VStack{
            HStack{
                Text("Attack")
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 50, alignment: .leading)
                Bar(value: $attack, colorBar: $colorBar)
                    .frame(height:15)
            }
            HStack{
                Text("Defense")
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 50, alignment: .leading)

                Bar(value: $defense, colorBar: $colorBar)
                    .frame(height:15)
            }
            HStack{
                Text("Height")
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 50, alignment: .leading)

                Bar(value: $height, colorBar: $colorBar)
                    .frame(height:15)
            }
            HStack{
                Text("Weight")
                    .foregroundColor(.black)
                    .font(.caption)
                    .frame(width: 50, alignment: .leading)

                Bar(value: $weight, colorBar: $colorBar)
                    .frame(height:15)
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(attack: .constant(0), defense: .constant(0), height: .constant(0), weight: .constant(0), colorBar: .constant(.clear))
    }
}
