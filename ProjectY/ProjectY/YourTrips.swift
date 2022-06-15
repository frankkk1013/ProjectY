//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI
//import GooglePlaces

struct APIRESPONSE: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
}

struct URLS: Codable {
    let full: String
}

struct Component: Identifiable {
    let id = UUID()

    let result: Result
    let destination: String
}

struct YourTrips: View {
    static var modalDismissedCount = 0
    @StateObject var trips: UseTrip
    @State private var isPresented = false
    @State private var isDetails = false
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []), sustainableLeaf: "", url: "")
    @StateObject var settings = Settings()
//    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    @State var results: [Result] = []
    @State var data: [Component] = []
    @State var needsReload = true
    
    func fetchImage() {
        if needsReload{
            self.needsReload = false
            print("Il count è: " + String(trips.listOfTrips.count))
            for (index, name) in trips.listOfTrips.enumerated(){
                let trip = trips.listOfTrips[index]
                let url = URL(string: "https://api.unsplash.com/search/photos?page=1&query="+trip.city+"&client_id=iV5JZ0Ml0fraKEgherDyraikAxr4nw6ii4wjxlRnZPY")!
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data else { return }
                    
                do {
                    var urlImage = ""
                    let jsonResult = try JSONDecoder().decode(APIRESPONSE.self, from: data)
                    
                    if jsonResult.results.count>0 {
                        urlImage = jsonResult.results[0].urls.full
                    }else{
                        urlImage =  "https://images.unsplash.com/photo-1470723710355-95304d8aece4?crop=entropy"
                    }
                    
                    DispatchQueue.main.async {
                        trips.listOfTrips[index].url = urlImage
                    }
                   
                } catch let parseErr {
                  print("JSON Parsing Error", parseErr)
                }
              }
                task.resume()
            }
        }
        
    }
        
    
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(self.trips.listOfTrips, id: \.id){ trip in
                    CardView(name: trip.city, imageName: trip.url)
                        .onTapGesture {
                            tripToShow = trip
                            print(trip.tripDetails)
                            isDetails.toggle()
                            print("tappato")
                        }.listRowSeparator(.hidden)
                        .padding()
                    
                }.onDelete(perform: delete)
            }
            .onAppear(perform: fetchImage)
            .navigationTitle("Trips")
                .background{
                    NavigationLink("", isActive: $isDetails, destination: { DestinationDetails(trips: trips, trip: tripToShow) })
                }
                .navigationBarItems(leading: Button(action:{
                    isPresented.toggle()
                    
                },label: {
                    Image(systemName: "plus")
                }),
                trailing: EditButton()
                )
        }
        .listStyle(InsetListStyle())
        
        
        .fullScreenCover(isPresented: $isPresented, content: AddingSheet.init)
//        .environmentObject(Settings())
       
        
      
        //.listStyle(.inset)
        
//        .navigationBarItems(leading: EditButton())
        
    }
    
    func delete(at offsets: IndexSet){
        if let first = offsets.first{
            self.trips.handleDelete(newValueTrip: trips.listOfTrips[first])
            
            print(trips.listOfTrips)
        }
    }
}
    
    
    //    func delete(at offsets: IndexSet) {
    //
    //        if let first = offsets.first {
    //
    //            .remove(at: first)
    //
    //        }
    //    }



//struct YourTrips_Previews: PreviewProvider {
//    static var previews: some View {
//        YourTrips()
//    }
//}


