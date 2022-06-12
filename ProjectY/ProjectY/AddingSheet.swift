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
    @State var defaultLists: [ToDoList] = []
    @EnvironmentObject var settings: Settings
    @State var pageName: String = "HomeView"
    var prova: ToDoList = ToDoList(name: "String", rows: [Row(category: "Hotel", title: "shampoo", sustainable: "false", description: "hello", season: "winter", checked: "false"),
                                                          Row(category: "Hotel", title: "shampoo", sustainable: "false", description: "hello", season: "winter", checked: "false")], completePercent: "10")
    
    
    
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
                HomeView(settings: settings).tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }.onAppear{
                    pageName = "HomeView"
                    
                }
                .tag(0)
                Trasportation(from: settings).tabItem {
                    Image(systemName: "circle")
                    Text("One")
                }.onAppear{
                    pageName = "Transportation"
                    
                }
                .tag(1)
                Accomodation(from: settings).tabItem {
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
                    var list: UseList = UseList()
                    var listToAdd: [ToDoList] = []
                    var rows: [Row] = []
                    var flag: Bool = false
                   
                    
                    
                    settings.pref.forEach{pref in
                        if pref.elements.count >= 2{
                            flag = true
                            
                        }else{
                            flag = false
                        }
                        
                    }
                    
                    if selectedTab == 5 && flag  {
                        // creare oggetto trip, con liste consigliate e salvare
                        settings.pref.forEach { pref in
                            // cerca le liste da consigliare
                        }
                        
                        
                       
                        /*   Per ogni lista salvate, per ogni riga, controllo se
                         tra i filtri scelti esiste un elemento nella lista
                         appartenente a uno dei filtri scelti oppure se non
                         appartiene a nessuna categoria e lo aggiungo al trip da
                         creare per l'utente
                         */
                        
                        defaultLists.forEach{ lista in
                            
                            rows = []
                           
                            if (lista.name == "Essentials" ||
                                lista.name == "Medicines" ||
                                lista.name == "Bathroom"  ||
                                lista.name == "Make up"  ||
                                lista.name == "Personal Documents"){
                               
                               
                                lista.rows.forEach{ row in
                                    if settings.pref.contains(where: {$0.name == row.category}) || row.category == "any"{
                                        rows.append(row)
                                        
                                        
                                        
                                    }
                                    
                                }
                                if !rows.isEmpty{
                                    listToAdd.append(ToDoList(name: lista.name, rows: rows, completePercent: "0"))
                                }
                                
                            }else{
                                settings.pref.forEach{ preferenza in
                                    if preferenza.elements.contains(where: {$0 == lista.name}){
                                        lista.rows.forEach{ row in
                                            
                                            if settings.pref.contains(where: {$0.name == row.category}) || row.category == "any"{
                                                rows.append(row)
                                                
                                                
                                            }
                                            
                                        }
                                        if !rows.isEmpty{
                                            listToAdd.append(ToDoList(name: lista.name, rows: rows, completePercent: "0"))
                                        }
                                    }
                                    
                                }
                               
                               
                            }
                            
                            
                            
                            
                            
                            
                        }
//                        listToAdd.forEach{ listss in
//                            print(listss.name)
//
//                        }
                        
                        
                        trips.CreateTrip(newValueTrip: Trip(city: settings.pref[0].elements.first(where: {!$0.starts(with: "Optional")})!, lists: listToAdd , tripDetails: TripDetails(pref: settings.pref), sustainableLeaf: ""), currentModifiedLists: list.lists)
//                        print(defaultLists)
//                        print(listToAdd)
                        
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
            
            
        }.onAppear{
            self.readFile()
//            print(defaultLists)
        }
    }
    
    private func readFile() {
        if let url = Bundle.main.url(forResource: "listseng", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
//            let decoder = JSONDecoder()
            
            do {
                let decoder = JSONDecoder()
                let messages = try decoder.decode([ToDoList].self, from: data)
                self.defaultLists = messages
//                print(messages as Any)
            } catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
           
//            if let jsonData = try? decoder.decode([ToDoList].self, from: data) {
//               
////                self.defaultLists = jsonData
//                
//            }
        }
    }
    
}

struct AddingSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddingSheet()
    }
}
