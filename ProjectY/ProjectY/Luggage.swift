//
//  Luggage.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Luggage: View {
    @State var next: Bool = false
    private var uiData : [UiData] = [UiData(name: "Suitcase", icon: "Suitcase"),UiData(name: "Backpack", icon: "Backpack"),UiData(name: "Duffle Bag", icon: "Duffle Bag"),UiData(name: "Tote Bag", icon: "Tote Bag"),UiData(name: "Bucket Bag", icon: "Bucket Bag"),UiData(name: "Briefcase", icon: "Briefcase")]
    
    private var more = ["5 - 13","14-110"]
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    private var secondGridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
    
    @StateObject var settings = Settings()
    var body: some View {
        
        
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
                        ForEach(more, id: \.self) { weight in
                            RectangularElement(text: "Balance", kg: "\(weight)")
                                .environmentObject(settings).padding(.top)
                            
                        }
                    }
                    Spacer()
                    
                    HStack{
                        
                        Button {
                            print(settings.elements.isEmpty)
                            if !settings.elements.isEmpty && !settings.second.isEmpty{
                                next.toggle()
                            }
                        } label: {
                            Text("Continue                 ")
                                .font(.title3).bold()
                                .padding()
                                .foregroundColor(.white)
                                .background(Color((settings.elements.isEmpty || settings.second.isEmpty ) ? "Square" : "GreenSquare")).cornerRadius(12)
                            
                        }.frame(width: 197, height: 50)
                            .padding(.top)
                        
                        
                        
                        
                        
                    }
                }
                
            }
            .background{
                NavigationLink("", isActive: $next, destination: { Activities()})
            }
        .navigationTitle("Luggage")
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
