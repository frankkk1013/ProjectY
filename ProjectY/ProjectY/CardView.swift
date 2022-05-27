//
//  CardView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct CardView: View {
    
    var name: String
    var imageName: String
    
    var gradient = Gradient(colors: [Color.green, Color.green])
    var opacityValue = 0.3
    
    var body: some View{
        
        ZStack{
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 360, height: 240)
                .mask(RoundedRectangle(cornerRadius: 35))
                .saturation(0)
            
            LinearGradient(
                gradient: gradient,
                startPoint: .bottom,
                endPoint: .top)
                .frame(width: 360, height: 240)
                .mask(RoundedRectangle(cornerRadius: 35))
                .opacity(opacityValue)
                .brightness(0.1)
            
            HStack(alignment: .bottom) {
                Text(name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .offset(x: 48, y: 84)
                    .foregroundColor(Color.white)
                
                Spacer()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(name: "Destination", imageName: "spiaggia")
    }
}
