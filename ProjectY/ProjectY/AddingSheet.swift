//
//  AddingSheet.swift
//  ProjectY
//
//  Created by Francesco Iaccarino on 29/05/22.
//

import SwiftUI

struct AddingSheet: View {
//    @State var selection: Bool = false
    @State var selectedTab: Int = 0
    @EnvironmentObject var settings: Settings
    @State var pageName: String = "HomeView"
    
    

//      @Binding var isShowingDetail: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark.circle").foregroundColor(.black)
                        .font(.title2)
                })
            }.padding(.trailing)
            TabView(selection: $selectedTab) {
                HomeView().tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }.onAppear{
                    pageName = "HomeView"
                    
                }
                .tag(0)
                Trasportation().tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }.onAppear{
                    pageName = "Trasportation"
                    
                }
                .tag(1)
                Accomodation().tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }
                .tag(2)
                .onAppear{
                    pageName = "Accomodation"
                }
                Luggage(from: settings).tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }
                .tag(3)
                .onAppear{
                    pageName = "Luggage"
                }
                Activities().tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }
                .tag(4)
                .onAppear{
                    pageName = "Activities"
                }
                .onChange(of: selectedTab ){ newValue in
                    if selectedTab == 5 {
                        presentationMode.wrappedValue.dismiss()
                        
                    }
                    
                }
                
                
               
                
                
                          
                      }.environmentObject(settings)
                .tabViewStyle(PageTabViewStyle())
               .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            HStack{
                
                
                               
                Button {
                    if pageName != "Luggage"{
                        if !settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.isEmpty
                          {
                            selectedTab += 1
                        
                            
                        }
                        
                    }else{
                        if (settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.count >= 2)
                          {
                            selectedTab += 1
                            
                        }
                        
                    }
                    print(settings.pref)
                    
                    
                } label: {
                    Text("Continue                 ")
                        .font(.title3).bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Color(pageName == "Luggage"
                                  ?
                                  (settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.count >= 2 ?  "GreenSquare" : "Square")
                                  : ((settings.pref[settings.pref.firstIndex(where: {$0.name == pageName} )!].elements.isEmpty) ? "Square" : "GreenSquare")).cornerRadius(12))
                    
                    
                    
                }.frame(width: 197, height: 50)
                    .padding(.top)
                
                
                
                
                
            }
            
            
        }
    }
}

struct AddingSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddingSheet()
    }
}
