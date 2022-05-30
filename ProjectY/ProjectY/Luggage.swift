//
//  Luggage.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Luggage: View {
    @State var selected: Bool
    @EnvironmentObject var settings: Settings
//    @Binding var tabSelection: Int
    @State var colorFlag: Bool = true
    @State var colorSq1: String = "GreenSquare"
    @State var colorSq2: String = "Square"
    @State var colorTxt2: Color = .black
    @State var colorTxt1: Color = .white
    
    
    private var uiData : [UiData] = [UiData(name: "Suitcase", icon: "Suitcase"),UiData(name: "Backpack", icon: "Backpack"),UiData(name: "Duffle Bag", icon: "Duffle Bag"),UiData(name: "Tote Bag", icon: "Tote Bag"),UiData(name: "Bucket Bag", icon: "Bucket Bag"),UiData(name: "Briefcase", icon: "Briefcase")]
    
    private var more = ["5 - 13","14-110"]
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())]
    private var secondGridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
    
    
    
    var body: some View {
        
        
            ScrollView{
                VStack{
                    LazyVGrid(columns: gridItemLayout, spacing: 20){
                        ForEach(uiData, id: \.self) { element in
                            SquareElement(pageName: "Luggage",text: "\(element.name)", image: element.icon)
                                .environmentObject(settings)
//                                .onTapGesture {
//                                    
//                                }
                            
                        }}
                    HStack{
                        Text("Size").bold()
                        Spacer()
                    }.padding()
                    LazyVGrid(columns: secondGridItemLayout, spacing: 0){
//                        ForEach(more, id: \.self) { weight in
//                            RectangularElement(text: "Balance", kg: "\(weight)")
//                                .environmentObject(settings).padding(.top)
//
//                        }
                        
                        HStack{
                            if colorFlag{
                                Image("Balance").font(.caption2)
                                    .foregroundColor(colorTxt1).foregroundColor(.white)
                                
                            }else{
                                Image("Balance").font(.caption)
                                    .foregroundColor(colorTxt1)
                            }
                            
                            
                            
                            Text(more[0]).font(.caption).bold()
                                .foregroundColor(colorTxt1)
                            
                            
                        }.background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(colorSq1))
                            .frame(width: 168, height: 65))
                            .padding().padding()
                            .onTapGesture {
                                colorFlag.toggle()
                                if colorFlag{
                                    colorSq1 = "GreenSquare"
                                    colorSq2 = "Square"
                                    colorTxt1 = .white
                                    colorTxt2 = .black
                
                                    
                            
                                }else{
                                    colorSq1 = "Square"
                                    colorSq2 = "GreenSquare"
                                    colorTxt1 = .black
                                    colorTxt2 = .white
              
                                    
                                }
                                
                            }
                        
                        HStack{
                            if !colorFlag{
                                Image("Balance").font(.caption2)
                                    .foregroundColor(colorTxt2).foregroundColor(.white)
                                
                            }else{
                                Image("Balance").font(.caption)
                                    .foregroundColor(colorTxt2)
                            }
                            
                            
                            
                            Text(more[1]).font(.caption).bold()
                                .foregroundColor(colorTxt2)
                            
                            
                        }.background(RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(colorSq2))
                            .frame(width: 168, height: 65))
                            .padding().padding()
                            .onTapGesture {
                                colorFlag.toggle()
                                if !colorFlag{
                                    colorSq1 = "Square"
                                    colorSq2 = "GreenSquare"
                                    colorTxt2 = .white
                                    colorTxt1 = .black
                //                    settings.second.append(text)
                            
                                }else{
                                    colorSq1 = "GreenSquare"
                                    colorSq2 = "Square"
                                    colorTxt2 = .black
                                    colorTxt1 = .white
                //                    settings.second.remove(at: settings.second.firstIndex(of: text)!)
                                    
                                }
                                
                            }
                    }
                    Spacer()
                    
//                    HStack{
//                        
//                        Button {
//                            print(settings.elements.isEmpty)
//                            if !settings.elements.isEmpty && !settings.second.isEmpty{
//                                next.toggle()
//                                
//                            }
//                        } label: {
//                            Text("Continue                 ")
//                                .font(.title3).bold()
//                                .padding()
//                                .foregroundColor(.white)
//                                .background(Color((settings.elements.isEmpty || settings.second.isEmpty ) ? "Square" : "GreenSquare")).cornerRadius(12)
//                            
//                        }.frame(width: 197, height: 50)
//                            .padding(.top)
//                        
//                        
//                        
//                        
//                        
//                    }
                }
                
            }
//            .background{
//                NavigationLink("", isActive: $next, destination: { Activities()})
//            }
        .navigationTitle("Luggage")
            .navigationBarBackButtonHidden(false)
            .onAppear{
                if colorFlag && (settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.firstIndex(where: {$0 == more[0] } ) == nil) {
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.append(more[0])
                }
                if !colorFlag && (settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.firstIndex(where: {$0 == more[1] } ) == nil) {
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.append(more[1])
                    
                }
            }
            .onChange(of: colorFlag)  { newValue in
                if colorFlag{
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.append(more[0])
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.remove(at: settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.firstIndex(of: more[1])!)
                }else{
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.append(more[1])
                    settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.remove(at: settings.pref[settings.pref.firstIndex(where: {$0.name == "Luggage"} )!].elements.firstIndex(of: more[0])!)
                }
                print(settings.pref)
                
                
            }
    }
}

//struct Luggage_Previews: PreviewProvider {
//    static var previews: some View {
//        
////        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 11"))
////            .previewDisplayName("iPhone 11")
////        
////        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 8"))
////            .previewDisplayName("iPhone 8")
////        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus" ))
////            .previewDisplayName("iPhone 8 Plus")
////        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 13"))
////            .previewDisplayName("iPhone 13")
////        Luggage().previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
////            .previewDisplayName("iPhone 13 Pro Max")
//    }
//}
