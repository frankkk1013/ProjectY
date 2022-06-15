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
    @StateObject var settings: Settings = Settings()
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
                    YourTrips.modalDismissedCount += 1
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
                    flag = true
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
                        
//                        print(defaultLists)
//                        print(listToAdd)
                        var city = settings.pref[0].elements.first(where: {!$0.starts(with: "Optional")})!
                        var urlImage = ""
                        
                        
                        let url = URL(string: "https://api.unsplash.com/search/photos?page=1&query="+city+"&client_id=iV5JZ0Ml0fraKEgherDyraikAxr4nw6ii4wjxlRnZPY")!
                        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                        guard let data = data else { return }
                            
                        do {

                            let jsonResult = try JSONDecoder().decode(APIRESPONSE.self, from: data)
                            DispatchQueue.main.async {
                                                                
                                
                                if jsonResult.results.count>0 {
                                    urlImage = jsonResult.results[0].urls.full
                                }else{
                                    urlImage =  "https://images.unsplash.com/photo-1470723710355-95304d8aece4?crop=entropy"
                                }
                                
                                trips.CreateTrip(newValueTrip: Trip(city: city, lists: listToAdd , tripDetails: TripDetails(pref: settings.pref), sustainableLeaf: "", url: urlImage), currentModifiedLists: list.lists)
                                
                                presentationMode.wrappedValue.dismiss()
                            }
                           
                        } catch let parseErr {
                          print("JSON Parsing Error", parseErr)
                        }
                      }
                        task.resume()
                        
                        
                        
                    }
                    
                }
                
                
                
                
                
                
            }.environmentObject(settings)
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            HStack{
                
                
                
                Button {
                    
                    withAnimation{
                        if pageName != "Luggage" || pageName != "HomeView"{
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
                    }
                    
                    
                } label: {
                    Text("Continue                 ")
                        .font(.title3).bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(
                            Color((pageName == "Luggage" || pageName == "HomeView")
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
        .padding()
       
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
