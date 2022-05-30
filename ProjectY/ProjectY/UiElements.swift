//
//  UiElements.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import Foundation
import SwiftUI

struct UiData:  Hashable {
    var name: String
    var icon: String
}

struct pagePref{
    var name: String
    var elements: [String]
}

class Settings: ObservableObject {
//    @Published var flag = false
//    @Published var elements: [String] = []
//    @Published var second: [String] = []
    
    @Published var pref: [pagePref] = []
    
    init() {
        pref.append(pagePref(name: "HomeView", elements: []))
        pref.append(pagePref(name: "Trasportation", elements: []))
        pref.append(pagePref(name: "Accomodation", elements: []))
        pref.append(pagePref(name: "Luggage", elements: []))
        pref.append(pagePref(name: "Activities", elements: []))
    }
}

struct SquareElement: View{
    @State var second : Bool = false
    @EnvironmentObject var settings: Settings
    @State var pageName: String
    
    var text: String
    var image: String
    @State var colorFlag: Bool = false
    @State var colorSq: String = "Square"
    @State var colorTxt: Color = .black
    @State var width: CGFloat = 120
    @State var height: CGFloat = 120
    @ScaledMetric var size: CGFloat = 1
    
    
    var body: some View{
       
        
        VStack{
            if colorFlag{
                Image( image)
                    .foregroundColor(colorTxt).padding(.bottom).foregroundColor(.white)
                
            }else{
                Image( image)
                    .foregroundColor(colorTxt).padding(.bottom)
            }
            
            
            Text(text).bold().font(.headline)
                .foregroundColor(colorTxt).minimumScaleFactor(0.0001)
               
                    .lineLimit(1)
            
        }.background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(colorSq))
            .frame(width: width, height: width)

        )
            .padding()
            .onTapGesture {
                colorFlag.toggle()
                if colorFlag{
                    colorSq = "GreenSquare"
                    colorTxt = .white
//                    if second {
//                        settings.pref.append(text)
//
//                    }else{
//                        settings.elements.append(text)
//
//                    }
                
                    settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.append(text)
                    
                    
            
                }else{
                    colorSq = "Square"
                    colorTxt = .black
                    settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.remove(at: settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.firstIndex(of: text)!)
//                    if second {
//                        settings.second.remove(at: settings.second.firstIndex(of: text)!)
//
//                    }else{
//                        settings.elements.remove(at: settings.elements.firstIndex(of: text)!)
//
//                    }
                    
                    
                }
                
                
            }
        

            .padding()
       
        
    }
}

struct RectangularElement: View{
    @EnvironmentObject var settings: Settings
    var text: String
    var kg: String
    @State var colorFlag: Bool = false
    @State var colorSq: String = "Square"
    @State var colorTxt: Color = .black
//    @Binding var selection: Bool
    
    var body: some View{
       
        
        HStack{
            if colorFlag{
                Image(text).font(.caption2)
                    .foregroundColor(colorTxt).foregroundColor(.white)
                
            }else{
                Image(text).font(.caption)
                    .foregroundColor(colorTxt)
            }
            
            
            
            Text(kg).font(.caption).bold()
                .foregroundColor(colorTxt)
            
            
        }.background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(colorSq))
            .frame(width: 168, height: 65))
            .padding().padding()
            .onTapGesture {
                colorFlag.toggle()
                if colorFlag{
                    colorSq = "GreenSquare"
                    colorTxt = .white
//                    settings.second.append(text)
            
                }else{
                    colorSq = "Square"
                    colorTxt = .black
//                    settings.second.remove(at: settings.second.firstIndex(of: text)!)
                    
                }
                
            }

        
        
        
    }
}


//struct SquareElement: View{
//    @EnvironmentObject var settings: Settings
//    var text: String
//    var image: String
//    @State var colorFlag: Bool = false
//    @State var colorSq: String = "Square"
//    @State var colorTxt: Color = .black
//    @State var width: CGFloat = 120
//    @State var height: CGFloat = 120
//    @ScaledMetric var size: CGFloat = 1
//
//
//    var body: some View{
//        Spacer()
//
//        VStack{
//            Image(systemName: image).font(.title3)
//                .foregroundColor(colorTxt).padding()
//
//            Text(text).font(.title3).bold()
//                .foregroundColor(colorTxt)
//
//        }.background(RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(Color(colorSq))
//            .frame(width: width * size, height: height * size))
//            .padding()
//            .onTapGesture {
//                colorFlag.toggle()
//                if colorFlag{
//                    colorSq = "OrangeSquare"
//                    colorTxt = .white
//                    settings.elements.append(text)
//
//                }else{
//                    colorSq = "Square"
//                    colorTxt = .black
//                    settings.elements.remove(at: settings.elements.firstIndex(of: text)!)
//
//                }
//
//            }
////            .padding(.trailing)
////            .padding(.leading)
//        Spacer()
//
//
//    }
//}
//
//struct RectangularElement: View{
//    @EnvironmentObject var settings: Settings
//    var text: String
//    var kg: String
//    @State var colorFlag: Bool = false
//    @State var colorSq: String = "Square"
//    @State var colorTxt: Color = .black
//
//    var body: some View{
//        Spacer()
//
//        HStack{
//
//
//            Text(text).font(.title3).bold()
//                .foregroundColor(colorTxt)
//            Text(kg).font(.caption).bold()
//                .foregroundColor(colorTxt)
//
//
//        }.background(RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(Color(colorSq))
//            .frame(width: 168, height: 65))
//            .padding().padding()
//            .onTapGesture {
//                colorFlag.toggle()
//                if colorFlag{
//                    colorSq = "OrangeSquare"
//                    colorTxt = .white
//                    settings.second.append(text)
//
//                }else{
//                    colorSq = "Square"
//                    colorTxt = .black
//                    settings.second.remove(at: settings.second.firstIndex(of: text)!)
//
//                }
//
//            }
////            .padding(.trailing)
////            .padding(.leading)
//        Spacer()
//
//
//    }
//}
//
