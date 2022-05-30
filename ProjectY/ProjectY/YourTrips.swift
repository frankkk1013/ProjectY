//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct YourTrips: View {
    @State private var isPresented = false
    @StateObject var settings = Settings()
    
    
    var body: some View {
        
        
    
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(spacing: 0){
                    Spacer()
                    
                    NavigationLink(destination: DestinationDetails(), label: {
                        CardView(name: "Destination", imageName: "spiaggia")
                    })
                }
                .navigationTitle("Trips")
                Button("Present!") {
                           isPresented.toggle()
                       }
                .fullScreenCover(isPresented: $isPresented, content: AddingSheet.init )
            }.environmentObject(settings)
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


