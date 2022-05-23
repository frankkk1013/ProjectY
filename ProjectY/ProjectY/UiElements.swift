//
//  UiElements.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 23/05/22.
//

import Foundation
import SwiftUI

class Settings: ObservableObject {
    @Published var flag = false
    @Published var elements: [String] = []
    @Published var second: [String] = []
}

struct SquareElement: View{
    @EnvironmentObject var settings: Settings
    var text: String
    var image: String
    @State var colorFlag: Bool = false
    @State var colorSq: String = "Square"
    @State var colorTxt: Color = .black
    
    var body: some View{
        Spacer()
        
        VStack{
            Image(systemName: image).font(.title)
                .foregroundColor(colorTxt).padding()
            
            Text(text).font(.title3).bold()
                .foregroundColor(colorTxt)
            
        }.background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(colorSq))
            .frame(width: 120, height: 120))
            .padding().padding()
            .onTapGesture {
                colorFlag.toggle()
                if colorFlag{
                    colorSq = "OrangeSquare"
                    colorTxt = .white
                    settings.elements.append(text)
            
                }else{
                    colorSq = "Square"
                    colorTxt = .black
                    settings.elements.remove(at: settings.elements.firstIndex(of: text)!)
                    
                }
                
            }
//            .padding(.trailing)
//            .padding(.leading)
        Spacer()
        
        
    }
}

struct RectangularElement: View{
    @EnvironmentObject var settings: Settings
    var text: String
    var kg: String
    @State var colorFlag: Bool = false
    @State var colorSq: String = "Square"
    @State var colorTxt: Color = .black
    
    var body: some View{
        Spacer()
        
        HStack{
            
            
            Text(text).font(.title3).bold()
                .foregroundColor(colorTxt)
            Text(kg).font(.caption).bold()
                .foregroundColor(colorTxt)
            
            
        }.background(RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(colorSq))
            .frame(width: 168, height: 65))
            .padding().padding()
            .onTapGesture {
                colorFlag.toggle()
                if colorFlag{
                    colorSq = "OrangeSquare"
                    colorTxt = .white
                    settings.second.append(text)
            
                }else{
                    colorSq = "Square"
                    colorTxt = .black
                    settings.second.remove(at: settings.second.firstIndex(of: text)!)
                    
                }
                
            }
//            .padding(.trailing)
//            .padding(.leading)
        Spacer()
        
        
    }
}
