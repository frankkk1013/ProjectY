//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct YourTrips: View {
    
    var body: some View {
        
        List {
            
//            ForEach () { CardView in
//        }
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 1", imageName: "spiaggia")
            }).listRowSeparator(.hidden)
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 2", imageName: "spiaggia")
            }).listRowSeparator(.hidden)
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 3", imageName: "spiaggia")
                    .swipeActions {
                        Button(role: .destructive){
                            print("Delete")
                        } label: {
                            Label("Delete", systemImage: "trash.fill")
                        }
                        
                        Button(role: .destructive){
                            print("Favorite")
                        } label: {
                            Label("Favorite", systemImage: "star.fill")
                        }.tint(.green)
                        
                    }
            }).listRowSeparator(.hidden)
            
        //.onDelete(perform: delete)
        }
        .listStyle(InsetListStyle())
//        .listStyle(.inset)
        .navigationTitle("Trips")
        .toolbar {
            EditButton()
        }
        
    }
    
    //    func delete(at offsets: IndexSet){
    //        CardView.remove(atOffsets: offsets)
    //    }
    
}


struct YourTrips_Previews: PreviewProvider {
    static var previews: some View {
        YourTrips()
    }
}


