//
//  YourTrips.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI
import GooglePlaces

struct YourTrips: View {
    @State private var isPresented = false
    @StateObject var settings = Settings()
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some View {
        
        
        
        List {
            
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
            
           
        }
        .background{
            Button("Present!") {
                isPresented.toggle()
            }
            .fullScreenCover(isPresented: $isPresented, content: AddingSheet.init )
            .environmentObject(settings)
            .navigationBarItems(leading:NavigationLink(destination: Text(""), label: {
                EditButton()
            }))
            .onAppear{
                if needsAppOnboarding{
                    isPresented.toggle()
                    
                }
                
            }
        }
        .listStyle(InsetListStyle())
        //        .listStyle(.inset)
        .navigationTitle("Trips")
        .toolbar {
            EditButton()
        }
        
        
    }
    
   
    
}


struct YourTrips_Previews: PreviewProvider {
    static var previews: some View {
        YourTrips()
    }
}


