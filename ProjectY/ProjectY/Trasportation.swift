//
//  Trasportation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Trasportation: View {
    @StateObject var settings = Settings()
    
    var body: some View {
        VStack{
            HStack{
                SquareElement(text: "Train", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Airplane", image: "airplane")
                    .environmentObject(settings)
            }
            HStack{
                SquareElement(text: "Train", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Airplane", image: "airplane")
                    .environmentObject(settings)
            }
            HStack{
                SquareElement(text: "Train", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Airplane", image: "airplane")
                    .environmentObject(settings)
            }
            Button {
                print("Button was tapped")
            } label: {
                Text("Continue                 ")
                    .font(.title3).bold()
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(settings.elements.isEmpty ? "Square" : "OrangeSquare")).cornerRadius(12)
                    
            }.frame(width: 197, height: 50)
                .padding(.top)
        }.navigationTitle("Trasportation")
        .navigationBarBackButtonHidden(false)
    }
}

struct Trasportation_Previews: PreviewProvider {
    static var previews: some View {
        Trasportation()
    }
}


