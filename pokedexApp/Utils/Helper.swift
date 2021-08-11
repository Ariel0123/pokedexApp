//
//  Helper.swift
//  pokedexApp
//
//  Created by Ariel Ortiz on 8/8/21.
//

import Foundation
import SwiftUI

extension Color{
    static func backgroundColorPokemon(forType type: String) -> Color {
        switch type {
        case "fire": return self.init(UIColor.systemRed)
        case "poison": return self.init(UIColor.systemGreen)
        case "water": return self.init(UIColor.systemBlue)
        case "electric": return self.init(UIColor.systemYellow)
        case "psychic": return self.init(UIColor.systemPurple)
        case "normal": return self.init(UIColor.systemOrange)
        case "ground": return self.init(UIColor.systemGray)
        case "flying": return self.init(UIColor.systemTeal)
        case "fairy": return self.init(UIColor.systemPink)
        default:
            return self.init(UIColor.systemIndigo)
        }

    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


extension String{
   
    func removeN() -> String{
        let tx = self
        return tx.replacingOccurrences(of: "\n", with: "")
      
        
    }
}
