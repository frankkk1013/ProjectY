//
//  Accomodation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Accomodation: View {
    @StateObject var settings = Settings()
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
//    private var uiData
    
    private var uiData : [UiData] = [UiData(name: "Hotel", icon: "tram.fill"),UiData(name: "Hotel1", icon: "tram.fill"),UiData(name: "Hotel2", icon: "tram.fill"),UiData(name: "Hotel3", icon: "tram.fill"),UiData(name: "Hotel4", icon: "tram.fill"),UiData(name: "Hotel5", icon: "tram.fill")]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20){
                ForEach(uiData, id: \.self) { element in
                    SquareElement(text: "\(element.name)", image: element.icon)
                        .environmentObject(settings)
                    
                }}.padding()
            VStack{
                
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
            }
        }.navigationTitle("Accomodation")
            .navigationBarBackButtonHidden(false)
    }
}

struct Accomodation_Previews: PreviewProvider {
    static var previews: some View {
        Accomodation().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
        
        Accomodation().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        Accomodation().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus" ))
            .previewDisplayName("iPhone 8 Plus")
        Accomodation().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
        Accomodation().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}
