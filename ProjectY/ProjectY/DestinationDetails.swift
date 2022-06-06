//
//  DestinationDetails.swift
//  ProjectY
//
//  Created by Raffaella Iacoviello on 24/05/22.
//

import SwiftUI

struct DestinationDetails: View {
    
    var body: some View {
        
        List {
            Section(header: Text("Checklists")
                .font(.title3)
                .fontWeight(.bold)) {
            NavigationLink(destination: Lists(), label: {
                CardListView(systemName: "tshirt.fill", name: "Clothes", counter: "9")
            })
//            .listRowSeparator(.hidden)
            
            NavigationLink(destination: Lists(), label: {
                CardListView(systemName: "comb.fill", name: "Toiletries", counter: "12")
            })
            
            NavigationLink(destination: Lists(), label: {
                CardListView(systemName: "beats.headphones", name: "Technology", counter: "11")
            })
            
            NavigationLink(destination: Lists(), label: {
                CardListView(systemName: "camera.fill", name: "Photography", counter: "8")
            })
        }
        }
//        .listStyle(InsetListStyle())
        .listStyle(.insetGrouped)
        .navigationTitle("Destination 1")
        
//        .toolbar {
//            ToolbarItem(placement: .primaryAction) {
//                Menu {
//                    Button(action: {}) {
//                        Label("Location and Date", systemImage: "calendar")
//                    }
//
//                    Button(action: {}) {
//                        Label("Transportation", systemImage: "airplane")
//                    }
//
//                    Button(action: {}) {
//                        Label("Accomodation", systemImage: "house.fill")
//                    }
//
//                    Button(action: {}) {
//                        Label("Luggage", systemImage: "suitcase.fill")
//                    }
//
//                    Button(action: {}) {
//                        Label("Activities", systemImage: "sun.max.fill")
//                    }
//                }
//            label: {
//                Label("", systemImage: "info.circle")
//            }
//
//            }
//        }
    }
}


struct DestinationDetails_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetails()
    }
}
