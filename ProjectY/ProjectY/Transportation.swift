//
//  Trasportation.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import SwiftUI



struct Trasportation: View {
//    @Binding var tabSelection: Int
    @ObservedObject var settings: Settings
    
    @State var next: Bool = false
    @State var pref: [String] = []
    @State var colorFlag: Bool = true
    
    
   
    
    private var gridItemLayout  = [GridItem(.flexible()),GridItem(.flexible())]
    private var uiData : [UiData] = [UiData(name: "Train", icon: "Train"),UiData(name: "Airplane", icon: "Airplane"),UiData(name: "Bus", icon: "Bus"),UiData(name: "Ferry", icon: "Ferry"),UiData(name: "Car", icon: "Car"),UiData(name: "Bike", icon: "Bike")]
    
    @ObservedObject var radio_1 : RadioButtons
    @ObservedObject var radio_2 : RadioButtons
    @ObservedObject var radio_3 : RadioButtons
    @ObservedObject var radio_4 : RadioButtons
    @ObservedObject var radio_5 : RadioButtons
    @ObservedObject var radio_6 : RadioButtons
    
    init(from settings: Settings){
        self.settings = settings
        self.radio_1 = RadioButtons(FromPage: "Transportation", FromElement: "Train", fromSettings: settings)
        self.radio_2 = RadioButtons(FromPage: "Transportation", FromElement: "Airplane", fromSettings: settings)
        self.radio_3 = RadioButtons(FromPage: "Transportation", FromElement: "Bus", fromSettings: settings)
        self.radio_4 = RadioButtons(FromPage: "Transportation", FromElement: "Ferry", fromSettings: settings)
        self.radio_5 = RadioButtons(FromPage: "Transportation", FromElement: "Car", fromSettings: settings)
        self.radio_6 = RadioButtons(FromPage: "Transportation", FromElement: "Bike", fromSettings: settings)
        
    }
    @State var color: [Bool] = [false, false, false, false, false, false]
   
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: gridItemLayout, spacing: 20){
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[0], id: radio_1.id, text: radio_1.title, image: radio_1.title){
                
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
                
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[1], id: radio_2.id, text: radio_2.title, image: radio_2.title){
                
                    print("helloooo")
                    radio_1.isSelected = false
                    radio_2.isSelected = true
                    radio_3.isSelected = false
                    radio_4.isSelected = false
                    radio_5.isSelected = false
                    radio_6.isSelected = false
                    color = [false, true, false, false, false, false]
                    print(settings.pref)
                   
                
                }
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[2], id: radio_3.id, text: radio_3.title, image: radio_3.title){
                
                    print("helloooo")
                    radio_1.isSelected = false
                    radio_2.isSelected = false
                    radio_3.isSelected = true
                    radio_4.isSelected = false
                    radio_5.isSelected = false
                    radio_6.isSelected = false
                    color = [false, false, true, false, false, false]
                    print(settings.pref)
                   
                
                }
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[3], id: radio_4.id, text: radio_4.title, image: radio_4.title){
                
                    print("helloooo")
                    radio_1.isSelected = false
                    radio_2.isSelected = false
                    radio_3.isSelected = false
                    radio_4.isSelected = true
                    radio_5.isSelected = false
                    radio_6.isSelected = false
                    color = [false, false, false, true, false, false]
                    print(settings.pref)
                   
                
                }
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[4], id: radio_5.id, text: radio_5.title, image: radio_5.title){
                
                    print("helloooo")
                    radio_1.isSelected = false
                    radio_2.isSelected = false
                    radio_3.isSelected = false
                    radio_4.isSelected = false
                    radio_5.isSelected = true
                    radio_6.isSelected = false
                    color = [false, false, false, false, true, false]
                    print(settings.pref)
                   
                
                }
                CustomRadioButton( pageName: "Transportation" , isPushed: $color[5], id: radio_6.id, text: radio_6.title, image: radio_6.title){
                
                    print("helloooo")
                    radio_1.isSelected = false
                    radio_2.isSelected = false
                    radio_3.isSelected = false
                    radio_4.isSelected = false
                    radio_5.isSelected = false
                    radio_6.isSelected = true
                    color = [false, false, false, false, false, true]
                    print(settings.pref)
                   
                
                }
                

        }.navigationTitle("Transportation")
        .navigationBarBackButtonHidden(false)
//        .onChange(of: colorFlag)  { newValue in
//            if colorFlag{
//                settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasportation"} )!].elements.append(more[0])
//                settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasporation"} )!].elements.remove(at: settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasporation"} )!].elements.firstIndex(of: more[1])!)
//            }else{
//                settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasporation"} )!].elements.append(more[1])
//                settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasporation"} )!].elements.remove(at: settings.pref[settings.pref.firstIndex(where: {$0.name == "Trasportation"} )!].elements.firstIndex(of: more[0])!)
//            }
//            print(settings.pref)
//            
//            
//        }
    }
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


