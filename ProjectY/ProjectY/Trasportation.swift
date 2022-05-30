//
//  Trasportation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Trasportation: View {
//    @Binding var tabSelection: Int
    @EnvironmentObject var settings: Settings
    @State var next: Bool = false
    @State var pref: [String] = []
    
    
   
    
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
    private var uiData : [UiData] = [UiData(name: "Train", icon: "Train"),UiData(name: "Airplane", icon: "Airplane"),UiData(name: "Bus", icon: "Bus"),UiData(name: "Ferry", icon: "Ferry"),UiData(name: "Car", icon: "Car"),UiData(name: "Bike", icon: "Bike")]
   
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20){
                ForEach(uiData, id: \.self) { element in
                    SquareElement(pageName: "Trasportation",text: "\(element.name)", image: element.icon)
                        .environmentObject(settings)
                    
                }}.padding()

        }.navigationTitle("Trasportation")
        .navigationBarBackButtonHidden(false)
    }
}

//struct Trasportation_Previews: PreviewProvider {
//    static var previews: some View {
//        Trasportation().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            .previewDisplayName("iPhone 11")
//        
//        Trasportation().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//            .previewDisplayName("iPhone 8")
//        Trasportation().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus" ))
//            .previewDisplayName("iPhone 8 Plus")
//        Trasportation().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
//            .previewDisplayName("iPhone 13")
//        Trasportation().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
//            .previewDisplayName("iPhone 13 Pro Max")
//    }
//}


