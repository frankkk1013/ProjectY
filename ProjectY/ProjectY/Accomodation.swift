//
//  Accomodation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Accomodation: View {
    @StateObject var settings = Settings()
    @State var next: Bool = false
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
//    private var uiData
    
    private var uiData : [UiData] = [UiData(name: "Hotel", icon: "Hotel"),UiData(name: "House", icon: "House"),UiData(name: "Hostel", icon: "Hostel"),UiData(name: "Camper", icon: "Camper"),UiData(name: "Roulotte", icon: "Roulotte"),UiData(name: "B&B", icon: "B&B")]
    
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
                    if !settings.elements.isEmpty{
                        next.toggle()
                    }
                } label: {
                    Text("Continue                 ")
                        .font(.title3).bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(settings.elements.isEmpty ? "Square" : "GreenSquare")).cornerRadius(12)
                    
                }.frame(width: 197, height: 50)
                    .padding(.top)
            }.background{
                NavigationLink("", isActive: $next, destination: { Luggage()})
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
