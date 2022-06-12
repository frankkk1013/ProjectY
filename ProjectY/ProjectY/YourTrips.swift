//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI
import GooglePlaces


struct YourTrips: View {
    @StateObject var trips: UseTrip
    @State private var isPresented = false
    @State private var isDetails = false
    @State private var tripToShow = Trip(city: "", lists: [], tripDetails: TripDetails(pref: []))
    @StateObject var settings = Settings()
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some View {
        
        
        NavigationView {
            List {
                ForEach(self.trips.listOfTrips, id: \.id){ trip in
                    CardView(name: trip.city, imageName: trip.city)
                        .onTapGesture {
                            tripToShow = trip
                            print(trip.tripDetails)
                            isDetails.toggle()
                            print("tappato")
                        }.listRowSeparator(.hidden)
                        .padding()
                        
                        
                    
                }.onDelete(perform: delete)
                
                
            }.navigationTitle("Trips")
                .background{
                    NavigationLink("", isActive: $isDetails, destination: { DestinationDetails(trips: trips, trip: tripToShow) })
                }
                .navigationBarItems(leading: Button(action:{
                    isPresented.toggle()
                    
                },label: {
                    Text("Add")
                }),
                trailing: EditButton()
                )
        }  .listStyle(InsetListStyle())
        
        
        .fullScreenCover(isPresented: $isPresented, content: AddingSheet.init)
        .environmentObject(settings)
       
        .onAppear{
            if needsAppOnboarding{
                isPresented.toggle()
                
            }
            
        }
      
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


