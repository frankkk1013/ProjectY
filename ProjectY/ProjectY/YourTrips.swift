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
        
        
        NavigationView {
        List {
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 1", imageName: "spiaggia")
            }).listRowSeparator(.hidden)
                .swipeActions{
                    Button(role: .destructive){
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            //                .onDelete(perform: delete)
            
            
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 2", imageName: "spiaggia")
            }).listRowSeparator(.hidden)
                .swipeActions{
                    Button(role: .destructive){
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            
            
            
            NavigationLink(destination: DestinationDetails(), label: {
                CardView(name: "Destination 3", imageName: "spiaggia")
            }).listRowSeparator(.hidden)
                .swipeActions{
                    Button(role: .destructive){
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash.fill")
                    }
                }
            
            
        }.navigationTitle("Trips")
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
        //.listStyle(.inset)
        .navigationTitle("Trips")
        .navigationBarItems(leading: EditButton())
        
        
    }
    
    //    func delete(at offsets: IndexSet) {
    //
    //        if let first = offsets.first {
    //
    //            .remove(at: first)
    //
    //        }
    //    }
}


struct YourTrips_Previews: PreviewProvider {
    static var previews: some View {
        YourTrips()
    }
}


