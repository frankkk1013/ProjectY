//
//  Luggage.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Luggage: View {
    
    @StateObject var settings = Settings()
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("Type").bold()
                Spacer()
            }.padding()
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
            }
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
            }
            HStack{
                Text("Size").bold()
                Spacer()
            }.padding()
            HStack{
                RectangularElement(text: "S     ", kg: "10 kg")
                    .environmentObject(settings)
                RectangularElement(text: "L     ", kg: "20 kg")
                    .environmentObject(settings)
                
            }
            Spacer()
            Button {
                print("Button was tapped")
            } label: {
                Text("Continue                 ")
                    .font(.title3).bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(Color((settings.elements.isEmpty || settings.second.isEmpty ) ? "Square" : "OrangeSquare")).cornerRadius(12)
                    
            }.frame(width: 197, height: 50)
                .padding(.top)
            Spacer()
        }.navigationTitle("Luggage")
            .navigationBarBackButtonHidden(false)
    }
}

struct Luggage_Previews: PreviewProvider {
    static var previews: some View {
        Luggage()
    }
}
