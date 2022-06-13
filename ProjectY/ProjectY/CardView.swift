//
//  CardView.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct CardView: View {
    
//    let id = UUID()
    var name: String
    var imageName: String
    
    var gradient = Gradient(colors: [Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 0.4036192602)), Color(#colorLiteral(red: 0.4032904506, green: 0.7195885181, blue: 0.4985763431, alpha: 0.4036192602))])
//    var opacityValue = 0.3
    
    @ViewBuilder
    func placeholderImage() -> some View {
        Image(systemName: "photo")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .foregroundColor(.gray)
    }
    
    var body: some View{
        
        ZStack{
            
            AsyncImage(url: URL(string: imageName)) { image in
                image
                    .resizable()
                    .frame(width: 355, height: 240)
                    .aspectRatio(contentMode: .fill)
                    .mask(RoundedRectangle(cornerRadius: 35))
                    .saturation(0)
            } placeholder: {
                placeholderImage()
            }
            
                
//
            LinearGradient(
                gradient: gradient,
                startPoint: .bottom,
                endPoint: .top)
                .frame(width: 355, height: 240)
                .mask(RoundedRectangle(cornerRadius: 35))
//                .opacity(opacityValue)
                .brightness(0.1)
            
            HStack() {
                Text(name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .offset(x: 50, y: 85)
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
