//
//  Bar.swift
//  pokeApp
//
//  Created by Ariel Ortiz on 7/30/21.
//

import SwiftUI

struct Bar: View {
    
    @Binding var value: Float
    @Binding var colorBar: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(geometry.size.width,  geometry.size.width * CGFloat(value/100)), height: geometry.size.height)
                    .foregroundColor(colorBar)
            }.cornerRadius(45.0)
              }
    }
}

struct Bar_Previews: PreviewProvider {
    static var previews: some View {
        Bar(value: .constant(Float(0.0)), colorBar: .constant(.black))
    }
}
