//
//  Activities.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Activities: View {
    @StateObject var settings = Settings()
    var body: some View {
        VStack{
            Spacer()
           
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
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
            }
            HStack{
                Text("More").bold()
                Spacer()
            }.padding(.top).padding(.leading)
            HStack{
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
                    .environmentObject(settings)
                SquareElement(text: "Hotel", image: "tram.fill")
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

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities()
    }
}
