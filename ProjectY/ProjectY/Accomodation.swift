//
//  Accomodation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Accomodation: View {
    //    @Binding var tabSelection: Int
    @State var next: Bool = false
    @EnvironmentObject var settings: Settings
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]

    
    private var uiData : [UiData] = [UiData(name: "Hotel", icon: "Hotel"),UiData(name: "House", icon: "House"),UiData(name: "Hostel", icon: "Hostel"),UiData(name: "Camper", icon: "Camper"),UiData(name: "Roulotte", icon: "Roulotte"),UiData(name: "B&B", icon: "B&B")]
    
    
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20){
                ForEach(uiData, id: \.self) { element in
                    SquareElement(pageName: "Accomodation",text: "\(element.name)", image: element.icon)
                        .environmentObject(settings)
                    
                }}.padding()

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
