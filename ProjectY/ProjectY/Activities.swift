//
//  Activities.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Activities: View {
    @State var second: Bool = false
    @EnvironmentObject var settings: Settings 
//    @Binding var tabSelection: Int
    @State var colorFlag: Bool = true
    
    
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    
    private var uiData : [UiData] = [UiData(name: "Relax", icon: "Relax"),UiData(name: "Work", icon: "Work"),UiData(name: "Swimming", icon: "Swimming"),UiData(name: "Photography", icon: "Photography"),UiData(name: "Ski", icon: "Ski"),UiData(name: "Hiking", icon: "Hiking"),UiData(name: "Cycling", icon: "Cycling"),UiData(name: "Concert", icon: "Concert"),UiData(name: "Theatre", icon: "Theatre")]
    private var more: [UiData] = [UiData(name: "Wheelchair", icon: "Wheelchair"),UiData(name: "Dog", icon: "Dog"),UiData(name: "Baby", icon: "Baby")]
    
    var body: some View {
        
            ScrollView{
                LazyVGrid(columns: gridItemLayout, spacing: 20){
                    ForEach(uiData, id: \.self) { element in
                        SquareElement(pageName: "Activities",text: "\(element.name)", image: element.icon )
                            .environmentObject(settings)
                        
                    }}
                    HStack{
                        Text("More").bold()
                        Spacer()
                    }.padding()
                LazyVGrid(columns: gridItemLayout, spacing: 20){
                        ForEach(more, id: \.self) { element in
                            SquareElement(second: true, pageName: "Activities",text: "\(element.name)", image: element.icon)
                                .environmentObject(settings)
                            
                        }}
                    Spacer()
                    
//                    HStack{
//                        
//                        Button {
//                            print(settings.elements.isEmpty)
//                            if !settings.elements.isEmpty{
//                                next.toggle()
//                            }
//                        } label: {
//                            Text("Continue                 ")
//                                .font(.title3).bold()
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color((settings.elements.isEmpty ) ? "Square" : "GreenSquare")).cornerRadius(12)
//                            
//                        }.frame(width: 197, height: 50)
//                            .padding(.top)
//                        
//                        
//                        
//                        
//                        
//                    }
//                }.background{
//                    NavigationLink("", isActive: $next, destination: { YourTrips()})
                }
                
            
            
            
            
            
            .navigationTitle("Activities")
            .navigationBarBackButtonHidden(false)
        
    }
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        Activities().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("iPhone 11")
        
        Activities().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            .previewDisplayName("iPhone 8")
        Activities().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus" ))
            .previewDisplayName("iPhone 8 Plus")
        Activities().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
            .previewDisplayName("iPhone 13")
        Activities().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            .previewDisplayName("iPhone 13 Pro Max")
    }
}



