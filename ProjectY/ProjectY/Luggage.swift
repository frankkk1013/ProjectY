//
//  Luggage.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI

struct Luggage: View {
//    @State var selected: Bool
    @ObservedObject var settings: Settings
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
    
    @ObservedObject var radio_1 :RadioButtons
    @ObservedObject var radio_2 : RadioButtons
    @ObservedObject var radio_3 : RadioButtons
    @ObservedObject var radio_4 : RadioButtons
    @ObservedObject var radio_5 : RadioButtons
    @ObservedObject var radio_6 : RadioButtons
    
    init(from settings: Settings){
        self.settings = settings
        self.radio_1 = RadioButtons(FromPage: "Luggage", FromElement: "Suitcase", fromSettings: settings)
        self.radio_2 = RadioButtons(FromPage: "Luggage", FromElement: "Backpack", fromSettings: settings)
        self.radio_3 = RadioButtons(FromPage: "Luggage", FromElement: "Duffle Bag", fromSettings: settings)
        self.radio_4 = RadioButtons(FromPage: "Luggage", FromElement: "Tote Bag", fromSettings: settings)
        self.radio_5 = RadioButtons(FromPage: "Luggage", FromElement: "Bucket Bag", fromSettings: settings)
        self.radio_6 = RadioButtons(FromPage: "Luggage", FromElement: "Briefcase", fromSettings: settings)
        
    }
    @State var color: [Bool] = [false, false, false, false, false, false]
    
    
    
    var body: some View {
        
        
            ScrollView{
                VStack{
                    LazyVGrid(columns: gridItemLayout, spacing: 20){
//                        ForEach(uiData, id: \.self) { element in
//                            SquareElement(pageName: "Luggage",text: "\(element.name)", image: element.icon)
//                                .environmentObject(settings)
////                                .onTapGesture {
////
////                                }
                        ///
                        ///
                           
                        CustomRadioButton( pageName: "Luggage", isPushed: $color[0], id: radio_1.id, text: radio_1.title, image: radio_1.title){
                            print("helloooo")
                            radio_1.isSelected = true
                            radio_2.isSelected = false
                            radio_3.isSelected = false
                            radio_4.isSelected = false
                            radio_5.isSelected = false
                            radio_6.isSelected = false
                            color = [true, false, false, false, false, false]
                            print(settings.pref)
                           
                        
                        }
//                        .environmentObject(settings)
                        CustomRadioButton( pageName: "Luggage", isPushed: $color[1], id: radio_2.id, text: radio_2.title, image: radio_2.title){
                            radio_1.isSelected = false
                            radio_2.isSelected = true
                            radio_3.isSelected = false
                            radio_4.isSelected = false
                            radio_5.isSelected = false
                            radio_6.isSelected = false
                            color = [false, true, false, false, false, false]
                          
                            
                        }
//                        .environmentObject(settings)
                        CustomRadioButton( pageName: "Luggage", isPushed: $color[2], id: radio_3.id, text: radio_3.title, image: radio_3.title){
                            radio_1.isSelected = false
                            radio_2.isSelected = false
                            radio_3.isSelected = true
                            radio_4.isSelected = false
                            radio_5.isSelected = false
                            radio_6.isSelected = false
                            color = [false, false, true, false, false, false]
                           
                        }
//                        .environmentObject(settings)
                        CustomRadioButton(pageName: "Luggage", isPushed: $color[3], id: radio_4.id, text: radio_4.title, image: radio_4.title){
                            radio_1.isSelected = false
                            radio_2.isSelected = false
                            radio_3.isSelected = false
                            radio_4.isSelected = true
                            radio_5.isSelected = false
                            radio_6.isSelected = false
                            color = [false, false, false, true, false, false]
                        }
//                        .environmentObject(settings)
                        CustomRadioButton(pageName: "Luggage", isPushed: $color[4], id: radio_5.id, text: radio_5.title, image: radio_5.title){
                            radio_1.isSelected = false
                            radio_2.isSelected = false
                            radio_3.isSelected = false
                            radio_4.isSelected = false
                            radio_5.isSelected = true
                            radio_6.isSelected = false
                            color = [false, false, false, false, true, false]
                        }
//                        .environmentObject(settings)
                        CustomRadioButton(pageName: "Luggage", isPushed: $color[5], id: radio_6.id, text: radio_6.title, image: radio_6.title){
                            radio_1.isSelected = false
                            radio_2.isSelected = false
                            radio_3.isSelected = false
                            radio_4.isSelected = false
                            radio_5.isSelected = false
                            radio_6.isSelected = true
                            color = [false, false, false, false, false, true]
                           
                            
                        }
//                        .environmentObject(settings)
                        }
                    
                }
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
