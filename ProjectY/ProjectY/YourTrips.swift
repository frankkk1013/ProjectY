//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct YourTrips: View {
    
    var body: some View {
        
    
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(spacing: 0){
                    Spacer()
                    
                    NavigationLink(destination: DestinationDetails(), label: {
                        CardView(name: "Destination", imageName: "spiaggia")
                    })
                }
                .navigationTitle("Trips")
            }
            .navigationBarItems(leading:NavigationLink(destination: Text(""), label: {
                EditButton()
            }))
        
    }
}


struct YourTrips_Previews: PreviewProvider {
    static var previews: some View {
        YourTrips()
    }
}


