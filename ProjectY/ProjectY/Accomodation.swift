//
//  Accomodation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Accomodation: View {
    @StateObject var settings = Settings()
    var body: some View {
        VStack{
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "House", image: "airplane")
                    .environmentObject(settings)
            }
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "House", image: "airplane")
                    .environmentObject(settings)
            }
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "House", image: "airplane")
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
        }.navigationTitle("Accomodation")
        .navigationBarBackButtonHidden(false)
    }
}

struct Accomodation_Previews: PreviewProvider {
    static var previews: some View {
        Accomodation()
    }
}
