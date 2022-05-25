//
//  Luggage.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Luggage: View {
    private var uiData : [UiData] = [UiData(name: "Hotel", icon: "tram.fill"),UiData(name: "Hotel1", icon: "tram.fill"),UiData(name: "Hotel2", icon: "tram.fill"),UiData(name: "Hotel3", icon: "tram.fill"),UiData(name: "Hotel4", icon: "tram.fill"),UiData(name: "Hotel5", icon: "tram.fill")]
    
    private var more = ["S","L"]
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    private var secondGridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
    
    @StateObject var settings = Settings()
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack{
                    LazyVGrid(columns: gridItemLayout, spacing: 20){
                        ForEach(uiData, id: \.self) { element in
                            SquareElement(text: "\(element.name)", image: element.icon)
                                .environmentObject(settings)
                            
                        }}
                    HStack{
                        Text("Size").bold()
                        Spacer()
                    }.padding()
                    LazyVGrid(columns: secondGridItemLayout, spacing: 0){
                        ForEach(more, id: \.self) { name in
                            RectangularElement(text: "\(name)", kg: "30 Kg")
                                .environmentObject(settings).padding(.top)
                            
                        }
                    }
                    Spacer()
                    
                    HStack{
                        
                        Button {
                            print(settings.elements.isEmpty)
                        } label: {
                            Text("Continue                 ")
                                .font(.title3).bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color((settings.elements.isEmpty || settings.second.isEmpty ) ? "Square" : "OrangeSquare")).cornerRadius(12)
                            
                        }.frame(width: 197, height: 50)
                            .padding(.top)
                        
                        
                        
                        
                        
                    }
                }
                
            }
        }.navigationTitle("Luggage")
            .navigationBarBackButtonHidden(false)
    }
}

struct Luggage_Previews: PreviewProvider {
    static var previews: some View {
        
        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
        
        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus" ))
            .previewDisplayName("iPhone 8 Plus")
        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}
